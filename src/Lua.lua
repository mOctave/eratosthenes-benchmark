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