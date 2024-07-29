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