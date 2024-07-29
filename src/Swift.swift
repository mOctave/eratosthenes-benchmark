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