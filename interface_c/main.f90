program test_interface_c

  use iso_c_binding, only : c_ptr, c_f_pointer
  use interface_c

  implicit none
  
  integer(kind=1) :: val_int1
  integer(kind=2) :: val_int2
  integer(kind=4) :: val_int4
  integer(kind=8) :: val_int8

  real :: val_float
  double precision :: val_double

  integer, parameter :: nvals=10
  integer :: i, rst
  integer(kind=1), dimension(:), allocatable :: array_int1

  ! this is a pointor to an array allcocated in C side
  type(c_ptr) :: parray
  integer, dimension(:), pointer :: parray_int

  val_int1 = 17
  val_int2 = 852
  val_int4 = 1258369
  val_int8 = 2147483632
  val_float = 3.141593
  val_double = 3.141592653589793
  
  write(*,*)
  write(*,*) "> [Test_interface_c] "

  ! ---------------------------------------------------------------------
  ! Just call a C function, no return, no args --------------------------
  ! ---------------------------------------------------------------------

  ! just display a string from c code
  call helloworld()

  ! ---------------------------------------------------------------------
  ! Send single variable to C function ----------------------------------
  ! ---------------------------------------------------------------------

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

  ! ---------------------------------------------------------------------
  ! Send 1D array to C function -----------------------------------------
  ! ---------------------------------------------------------------------

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

  ! ---------------------------------------------------------------------
  ! Operation on 1D array and get result from C -------------------------
  ! ---------------------------------------------------------------------

  write(*,*)
  write(*,*) "> [test_interface_c] Get sum of array elements from C ... "

  write(*,'(8x,a,$)') "> [Fortran Side] :"
  do i=1, nvals
    array_int1(i) = int(i,1)
    write(*,'(x,i2,$)') array_int1(i)
  enddo

  write(*,*)
  rst = compute_sum_c(array_int1, nvals)
  write(*,'(8x,a,i4)') "> [Fortran Side] : Sum of elements : ", rst

  ! ---------------------------------------------------------------------
  ! Get pointor to 1D array allocated in C ------------------------------
  ! ---------------------------------------------------------------------

  write(*,*)
  write(*,*) "> [test_interface_c] Get array from C allocation ... "

  parray = create_array_c(nvals)

  ! make fortran pointer from c pointer
  call c_f_pointer(cptr=parray, fptr =parray_int, shape =[nvals])

  write(*,'(8x,a,$)') "> [Fortran Side] :"
  do i=1, nvals
    write(*,'(x,i2,$)') parray_int(i)
  enddo
  write(*,*)

  call free_c_1d_array(parray)

  deallocate(array_int1)

end program test_interface_c
