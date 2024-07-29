use strict;
use warnings;

sub generate_primes {
    my ($limit) = @_;
    my @primes;
    my $i = 2;

    while ($i <= $limit) {
        my $seems_prime = 1;
        my $selected_prime = -1;
        my $j = 0;

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

main();