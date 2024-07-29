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
