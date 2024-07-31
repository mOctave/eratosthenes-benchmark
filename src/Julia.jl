function generatePrimes(limit)
    primes = Int[]

    for i in 2:limit
        seemsPrime = true
        selectedPrime = -1

        j = 1
        while j <= length(primes) && seemsPrime && selectedPrime <= sqrt(i)
            selectedPrime = primes[j]
            if i % selectedPrime == 0
                seemsPrime = false
            end
            j += 1
        end

        if seemsPrime
            push!(primes, i)
        end
    end

    return primes
end

function main()
    generatePrimes(1000000)
end

main()