// Copyright (c) 2025 by RisingLeaf.
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

#include <math.h>
#include <stdlib.h>

int *generatePrimes(const int maxNumber) {
  // approximation for how many primes are between 1 and maxNumber
  const int approximateCount = (int)((double)maxNumber / log(maxNumber));

  int *prime_list = calloc(approximateCount, sizeof(int));

  int size = 0;
  int is_prime = 1;
  for (int x = 2; x <= maxNumber; x+=1) {
    for (int i = 0; i < size && prime_list[i] <= sqrt(i); i++) {
      if (x % prime_list[i] == 0) {
        is_prime = 0;
        break;
      }
    }
    if (is_prime) {
      prime_list[size] = x;
      size++;
    }
    is_prime = 1;
  }

  return prime_list;
}

int main(int argc, const char **argv) {
  int *primes = generatePrimes(1000000);

  free(primes);
  return 0;
}
