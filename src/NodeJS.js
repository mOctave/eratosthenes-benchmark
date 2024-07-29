function generatePrimes(limit) {
    const primes = [];
    let i = 2;

    while (i <= limit) {
        let j = 0;
        let seemsPrime = true;
        let selectedPrime = -1;

        while (j < primes.length && selectedPrime <= Math.sqrt(i) && seemsPrime) {
            selectedPrime = primes[j];
            if (i % selectedPrime === 0) {
                seemsPrime = false;
            }
            j += 1;
        }

        if (seemsPrime) {
            primes.push(i);
        }

        i += 1;
    }

    return primes;
}

function main() {
    generatePrimes(1000000);
}
main();