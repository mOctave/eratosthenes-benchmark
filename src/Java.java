import java.util.ArrayList;
import java.util.List;

public class Java {
	public static List<Integer> generatePrimes(int limit) {
		List<Integer> primes = new ArrayList<>();
		for (int i = 2; i <= limit; i++) {
			int j = 0;
			boolean seemsPrime = true;
			int selectedPrime = -1;

			while (
				j < primes.size()
				&& seemsPrime
				&& selectedPrime <= Math.sqrt(i)
			) {
				selectedPrime = primes.get(j);

				if (i % selectedPrime == 0)
					seemsPrime = false;

				j++;
			}

			if (seemsPrime)
				primes.add(i);
		}

		return primes;
	}

	public static void main(String[] args) {
		generatePrimes(1000000);
	}
}
