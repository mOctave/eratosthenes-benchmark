# Copyright (c) 2024 by mOctave.
# 
# Eratosthenes Benchmark is free software: you can redistribute it and/or
# modify it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# Eratosthenes Benchmark is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import math;

def generatePrimes(limit):
  primes = []

  for i in range(2, limit + 1):
    j = 0
    seemsPrime = True
    selectedPrime = -1

    while (j < len(primes) and seemsPrime and selectedPrime <= math.sqrt(i)):
      selectedPrime = primes[j]
      if i % selectedPrime == 0:
        seemsPrime = False

      j += 1

    if seemsPrime:
      primes.append(i)
  
  return primes

def main():
  generatePrimes(1000000)

# Execute
main()
