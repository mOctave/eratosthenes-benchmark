// Copyright (c) 2024 by mOctave.
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

import Foundation

@main
public class Swift {
	public static func generatePrimes(limit:Int) -> Array<Int> {

		var primes: [Int] = [Int]()
		for i: Int in 2...limit {
			var j:Int = 0
			var seemsPrime:Bool = true
			var selectedPrime:Int = -1

			while (
				j < primes.count
				&& seemsPrime
				&& selectedPrime <= Int(sqrt(Double(i)))
			) {
				selectedPrime = primes[j]

				if i % selectedPrime == 0 {
					seemsPrime = false;
				}

				j += 1;
			}

			if seemsPrime {
				primes.append(i)
			}
		}

		return primes
	}

	static func main() {
		let _:[Int] = generatePrimes(limit: 1000000)
	}
}
