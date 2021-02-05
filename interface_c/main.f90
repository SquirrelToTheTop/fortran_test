program test_interface_c

  use interface_c

  implicit none
  
  integer(kind=1) :: val_int1
  integer(kind=2) :: val_int2
  integer(kind=4) :: val_int4
  integer(kind=8) :: val_int8

  real :: val_float
  double precision :: val_double

  integer, parameter :: nvals=10
  integer :: i
  integer(kind=1), dimension(:), allocatable :: array_int1

  val_int1 = 17
  val_int2 = 852
  val_int4 = 1258369
  val_int8 = 2147483632
  val_float = 3.141593
  val_double = 3.141592653589793
  
  write(*,*)
  write(*,*) "> [Test_interface_c] "

  ! just display a string from c code
  call helloworld()

  write(*,*)
  write(*,*) "> [test_interface_c] int data ... "
  ! send to C code a integer(kind=1)
  call send_c_int1(val_int1)

  ! send to C code a integer(kind=2)
  call send_c_int2(val_int2)

  ! send to C code a integer(kind=4)
  call send_c_int4(val_int4)

  ! send to C code a integer(kind=4)
  call send_c_int8(val_int8)

  write(*,*)
  write(*,*) "> [test_interface_c] real data ... "

  ! send to C code a float (4 bytes)
  call send_C_float(val_float)

  ! send to C code a float (8bytes)
  call send_C_double(val_double)

  write(*,*)
  write(*,*) "> [test_interface_c] 1D allocated array of int data ... "

  allocate(array_int1(nvals))
  write(*,'(8x,a,$)') "> [Fortran Side] :"
  do i=1, nvals
    array_int1(i) = int(i,1)
    write(*,'(x,i2,$)') array_int1(i)
  enddo

  write(*,*)
  call send_C_array_int1(array_int1, nvals)

end program test_interface_c
