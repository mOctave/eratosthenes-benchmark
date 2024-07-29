#include "CPP.h"
#include <cmath>
#include <iostream>
#include <vector>

using namespace std;

vector<int> generatePrimes(int limit) {
	vector<int> primes;
	for (int i = 2; i <= limit; i++) {
		int j = 0;
		bool seemsPrime = true;
		int selectedPrime = -1;

		while (
			j < primes.size()
			&& seemsPrime
			&& selectedPrime <= std::sqrt(i)
		) {
			selectedPrime = primes[j];

			if (i % selectedPrime == 0)
				seemsPrime = false;

			j++;
		}

		if (seemsPrime)
			primes.emplace_back(i);
	}

	return primes;
};

int main(int argc, char *argv[]) {
	vector<int> primes = generatePrimes(1000000);

	return 0;
};