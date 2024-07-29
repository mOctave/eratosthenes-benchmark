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

package main

import (
	"math"
)

func generatePrimes(limit int) []int {
	primes := []int{}

	for i := 2; i <= limit; i++ {
		j := 0
		seemsPrime := true
		selectedPrime := -1

		for j < len(primes) &&
			selectedPrime <= int(math.Sqrt(float64(i))) &&
			seemsPrime {

			selectedPrime = primes[j]
			if i%selectedPrime == 0 {
				seemsPrime = false
			}

			j++
		}

		if seemsPrime {
			primes = append(primes, i)
		}
	}

	return primes
}

func main() {
	generatePrimes(1000000)
}
