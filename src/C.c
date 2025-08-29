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
#include <stdio.h>
#include <stdlib.h>

int32_t *generatePrimes(const int32_t maxNumber) {
  // approximation for how many primes are between 1 and maxNumber
  const int32_t approximateCount = (int32_t)((double)maxNumber / log(maxNumber));

  int32_t *prime_list = calloc(approximateCount, sizeof(int32_t));

  int32_t size = 0;
  int8_t is_prime = 1;
  for (int32_t x = 2; x <= maxNumber; x+=1) {
    const int32_t sqrtX = (int32_t)sqrt(x);
    for (int32_t i = 0; i < size && prime_list[i] <= sqrtX; i++) {
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
  int32_t *primes = generatePrimes(1000000);

  free(primes);
  return 0;
}
