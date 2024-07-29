// Copyright (c) 2024 by iannl.
// 
// Eratosthenes Benchmark is free software: you can redistribute it and/or
// modify it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// Eratosthenes Benchmark is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
