package main

import (
	"math"
)

func generatePrimes(limit int) []int {
	primes := []int{}
	i := 2

	for i <= limit {
		seemsPrime := true
		selectedPrime := -1

		for j := 0; j < len(primes) && selectedPrime <= int(math.Sqrt(float64(i))) && seemsPrime; j++ {
			selectedPrime = primes[j]
			if i%selectedPrime == 0 {
				seemsPrime = false
			}
		}

		if seemsPrime {
			primes = append(primes, i)
		}

		i++
	}

	return primes
}

func main() {
	generatePrimes(1000000)
}
