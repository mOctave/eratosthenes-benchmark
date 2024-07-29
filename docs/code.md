# Algorithm

The algorithm for the Sieves of Eratosthenes in this project should all be the same, and formatted as close to identical as possible. There may be some changes from program to program (especially in the selection of data structures to store the primes), but in general languages should follow this pseudocode template, with every element in the order shown here:

```
function generatePrimes(integer limit) returns integer[] {
	integer[] primes = new integer[]()
	for (integer i = 2; i <= limit; i++) {
		integer j = 0
		boolean seemsPrime = true
		integer selectedPrime = -1

		while (j < primes.length && seemsPrime && selectedPrime <= sqrt(i)) {
			selectedPrime = primes[j]

			if (i % selectedPrime == 0) {
				seemsPrime = false
			}

			j++
		}

		if (seemsPrime) {
			primes.append(i)
		}
	}

	return primes
}

function main() {
	generatePrimes(1000000)
}
```

Programs should stay as close to this general structure as possible, including for variable names and the ordering of expressions and statements, as well as folloing the [styleguide](styleguide.md). If a language does not support a C-style for loop, the following style should be used instead, if it exists:

```
for (integer i in range(2, limit+1)) { }
```

Programs may be tested with something such as `print(generatePrimes(1000000))` but this should not be included in the final code. If a language throws a warning that the result of `generatePrimes()` is not being used, this should be assigned to a constant, preferrably one named `_`.