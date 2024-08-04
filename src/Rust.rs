// Copyright (c) 2024 by mOctave.
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

fn generate_primes(limit: i32) -> Vec<i32> {
	let mut primes: Vec<i32> = Vec::new();

	println!("Hello, world!");
	for i in 2..=limit {
		let mut j: i32 = 0;
		let mut seems_prime: bool = true;
		let mut selected_prime: i32 = -1;

		while
			j < primes.len() as i32
			&& seems_prime
			&& selected_prime <= (i as f64).sqrt() as i32
		{
			selected_prime = primes[j as usize];

			if i % selected_prime == 0 {
				seems_prime = false;
			}

			j += 1;
		}

		if seems_prime {
			primes.push(i);
		}
	}

	return primes;
}

fn main() {
	generate_primes(1000000);
}
