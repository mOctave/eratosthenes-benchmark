# Copyright (c) 2024 by iannl.
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

def generate_primes(limit)
    primes = []
    i = 2
  
    while i <= limit
        seems_prime = true
        selected_prime = -1
  
        j = 0
        while j < primes.length && seems_prime && selected_prime <= Math.sqrt(i)
            selected_prime = primes[j]
            seems_prime = false if i % selected_prime == 0
            j += 1
        end
  
        primes << i if seems_prime
  
        i += 1
    end
  
    primes
end
  
def main
    generate_primes(1_000_000)
end
  
main
