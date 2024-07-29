-- Copyright (c) 2024 by iannl.
-- 
-- Eratosthenes Benchmark is free software: you can redistribute it and/or
-- modify it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
--
-- Eratosthenes Benchmark is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
--
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

function generatePrimes(limit)
    local primes = {}
    local i = 2

    while i <= limit do
        local seemsPrime = true
        local j = 1
        local selectedPrime = primes[j]

        while j <= #primes and selectedPrime <= math.sqrt(i) and seemsPrime do
            selectedPrime = primes[j]
            if i % selectedPrime == 0 then
                seemsPrime = false
            end
            j = j + 1
        end

        if seemsPrime then
            table.insert(primes, i)
        end

        i = i + 1
    end

    return primes
end

function main()
    generatePrimes(1000000)
end

main()
