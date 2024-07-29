#!/usr/bin/env node

const util = require('util');
const exec = util.promisify(require('child_process').exec);
var colors = require('colors/safe')
var { version } = require('./package.json')
var fs = require("fs-extra");

var bconf = {
    cycles: 5,
    exclude: ['iris']
}

if(fs.existsSync(process.cwd() + '/bbconf.json')){
    var oconf = JSON.parse(fs.readFileSync(process.cwd() + '/bbconf.json'))
    for(let c in oconf) {
        bconf[c]=oconf[c]
    }
}

var bdata = []

async function main() {
    console.log(colors.bold(colors.blue('Running BenchmarkBot v' + version)))

    if (fs.existsSync(process.cwd() + '/benchmark.json')) {
        fs.rmSync('.bb_cache', { recursive: true, force: true })
        fs.copySync('src', '.bb_cache')

        var bmanifest = JSON.parse(fs.readFileSync(process.cwd() + '/benchmark.json'))

        for (let el of bconf.exclude) {
            delete bmanifest[el]
        }

        var blangs = Object.keys(bmanifest)

        var languageList = ""
        var lnum = 0

        for (let lang of blangs) {
            lnum++
            languageList += (lnum + ".").padEnd(4, " ") + colors.yellow(bmanifest[lang].language) + "\n"
        }

        console.log(colors.dim("\nBenchmarks will occur in this order:\n" + languageList))

        process.chdir('.bb_cache');

        for (let i = 0; i < bconf.cycles; i++) {
            console.log(colors.green('Starting cycle ' + (i + 1) + '/' + bconf.cycles))
            bdata[i] = {}
            for (let lang of blangs) {
                console.log(colors.blue('Testing ' + bmanifest[lang].language + '...'))
                await testlang(bmanifest[lang], i)
            }
        }

        process.chdir('..');

        console.log(colors.green('Done!'))
        fs.writeFileSync('bbout.json', JSON.stringify(bdata, null, 4))
    } else {
        console.log(colors.red('File "benchmarkbot.json" doesn\'t exist in current working directory.'))
    }
}
main()

async function testlang(blang, cycle) {
    bdata[cycle][blang.id] = {
        id: blang.id,
        language: blang.language,
        buildTime: 0,
        runTime: NaN
    }

    try {
        var { stdout, stderr } = await exec(blang.prereq);

        if (stderr || !stdout) throw stderr


        if (blang.buildcmd) {
            let cmdt = Date.now()
            try {
                var { stdout, stderr } = await exec(blang.buildcmd);
                if (stderr) throw stderr
            } catch (err) {
                console.log(colors.red('Failed to build with error: ' + err))
            }
            bdata[cycle][blang.id].buildTime = Date.now() - cmdt
        }
        cmdt = Date.now()
        try {
            var { stdout, stderr } = await exec(blang.runcmd);
            if (stderr) throw stderr
        } catch (err) {
            console.log(colors.red('Failed to run with error: ' + err))
        }
        bdata[cycle][blang.id].runTime = Date.now() - cmdt

    } catch (e) {
        console.log(colors.red('Couldn\'t run ' + blang.language + ', missing prerequisites.'))
    }
}