const util = require('util');
const exec = util.promisify(require('child_process').exec);
var colors = require('colors/safe')
var { version } = require('./package.json')
var fs = require('fs')

async function main() {
    console.log(colors.bold(colors.blue('Running BenchmarkBot v' + version)))

    if (fs.existsSync(process.cwd() + '/benchmark.json')) {
        var bmanifest = JSON.parse(fs.readFileSync(process.cwd() + '/benchmark.json'))
        var blangs = Object.keys(bmanifest)
        var languageList = ""
        var lnum = 0
        for (let lang of blangs) {
            lnum++
            languageList += lnum + ". " + colors.yellow(bmanifest[lang].language) + "\n"
        }
        console.log(colors.dim("\nBenchmarks will occur in this order:\n" + languageList))

        for (let lang of blangs) {
            console.log(colors.blue('Testing ' + bmanifest[lang].language + '...'))
            await testlang(bmanifest[lang])
        }
        console.log(colors.green('Done!'))
    } else {
        console.log(colors.red('File "benchmarkbot.json" doesm\'t exist in current working directory.'))
    }
}
main()

async function testlang(blang) {
    try{
        const { stdout, stderr } = await exec(blang.prereq);
        if(stderr||!stdout)throw stderr
    }catch{
        console.log(colors.red('Couldn\'t run '+blang.language+', missing prerequisites.'))
    }
}