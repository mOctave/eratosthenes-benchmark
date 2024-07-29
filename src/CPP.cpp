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
