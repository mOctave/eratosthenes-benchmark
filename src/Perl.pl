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

use strict;
use warnings;

sub generate_primes {
    my ($limit) = @_;
    my @primes;
    my $i = 2;

    while ($i <= $limit) {
        my $j = 0;
        my $seems_prime = 1;
        my $selected_prime = -1;

        while ($j < @primes && $seems_prime && $selected_prime <= sqrt($i)) {
            $selected_prime = $primes[$j];
            if ($i % $selected_prime == 0) {
                $seems_prime = 0;
            }
            $j++;
        }

        if ($seems_prime) {
            push @primes, $i;
        }

        $i++;
    }

    return @primes;
}

sub main {
    my @primes = generate_primes(1000000);
}

# Execute
main();
