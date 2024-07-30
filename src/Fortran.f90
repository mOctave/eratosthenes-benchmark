! Copyright (c) 2024 by mOctave.
! 
! Eratosthenes Benchmark is free software: you can redistribute it and/or
! modify it under the terms of the GNU Affero General Public License as
! published by the Free Software Foundation, either version 3 of the
! License, or (at your option) any later version.
!
! Eratosthenes Benchmark is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU Affero General Public License for more details.
!
! You should have received a copy of the GNU Affero General Public License
! along with this program.  If not, see <http://www.gnu.org/licenses/>.

module m
  implicit none
  contains

function generatePrimes(limit) result(primes)
  implicit none
  integer :: limit
  integer, dimension(limit) :: primes
  integer :: i
  integer :: j
  logical :: seemsPrime
  integer :: selectedPrime
  integer :: index = 0

  do i = 2, limit
    j = 0
    seemsPrime = .TRUE.
    selectedPrime = -1

    do while (j < size(primes) .and. seemsPrime &
              .and. selectedPrime <= sqrt(real(i)))
      selectedPrime = primes(j)

      if (modulo(i, selectedPrime) == 0) then
        seemsPrime = .FALSE.
      end if

      j = j + 1
    end do

    if (seemsPrime) then
      primes(index) = i
      index = index + 1
    end if

  end do
end function

subroutine main()
  print *, generatePrimes(1000000)
end subroutine
end module m

program Fortran
  call main()
end program Fortran
