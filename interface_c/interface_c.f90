!
! Use "value" means by copy then in the C side one can
! just have a signature like 'void print_int(int val)'
! if value is not used then the signature must be
! 'void print_int(int *val) because a pointor is sent
!

module interface_c

  ! use iso_c_binding

  ! public :: printBits2, test_compression
  ! contains

  interface

  ! ---------------------------------------------------------------------
  ! Just call a C function, no return, no args --------------------------
  ! ---------------------------------------------------------------------
  subroutine helloworld() bind(C, name="bonjour_from_c")
    use iso_c_binding
    implicit none 
    ! nothing
  end subroutine 

  ! ---------------------------------------------------------------------
  ! Send single variable to C function ----------------------------------
  ! ---------------------------------------------------------------------

  ! interface to send integer(kind=1)
  subroutine send_C_int1(val) bind(C, name="print_int1")
    use iso_c_binding
    implicit none 
    integer(C_INT8_T), intent(in) :: val
  end subroutine 
    

  ! interface to send integer(kind=2)
  subroutine send_C_int2(val) bind(C, name="print_int2")
    use iso_c_binding
    integer(c_short), intent(in) :: val
  end subroutine send_C_int2
   

  ! interface to send integer(kind=4)
  subroutine send_C_int4(val) bind(C, name="print_int4")
    use iso_c_binding
    integer(c_int), intent(in) :: val
  end subroutine send_C_int4
   

  ! interface to send integer(kind=4)
  subroutine send_C_int8(val) bind(C, name="print_int8")
    use iso_c_binding
    integer(c_long), intent(in) :: val
  end subroutine send_C_int8
   

  ! interface to send float(kind=4)
  subroutine send_C_float(val) bind(C, name="print_float")
    use iso_c_binding
    real(c_float), intent(in) :: val
  end subroutine send_C_float
   

  ! interface to send double(kind=4)
  subroutine send_C_double(val) bind(C, name="print_double")
    use iso_c_binding
    real(c_double), intent(in) :: val
  end subroutine send_C_double

  ! ---------------------------------------------------------------------
  ! Send 1D array to C function -----------------------------------------
  ! ---------------------------------------------------------------------

  ! interface to send pointor to array of integer (kind=1) + array size (copy)
  subroutine send_C_array_int1(arr_int1, nval) bind(C, name="print_array_int1")
    use iso_c_binding
    integer(c_int), intent(in), value :: nval
    integer(C_INT8_T), dimension(*) :: arr_int1
  end subroutine send_C_array_int1
   
  ! ---------------------------------------------------------------------
  ! Send 1D array to C function and get result --------------------------
  ! ---------------------------------------------------------------------

  ! interface to send pointor to array of integer (kind=1) + array size (copy)
  integer(c_int) function compute_sum_c(arr_int1, nval) bind(C, name="compute_sum")
    use iso_c_binding
    integer(c_int), intent(in), value :: nval
    integer(C_INT8_T), dimension(*), intent(in) :: arr_int1
  end function compute_sum_c

  ! ---------------------------------------------------------------------
  ! Get pointor to 1D array allocated in C ------------------------------
  ! ---------------------------------------------------------------------
  type(c_ptr) function create_array_c(nval) bind(C, name="create_1D_array")
    use iso_c_binding
    integer(c_int), intent(in), value :: nval
  end function create_array_c

  subroutine free_c_1d_array(parray) bind(C, name="free_1D_array")
    use iso_c_binding
    type(c_ptr), intent(in), value :: parray
  end subroutine free_c_1d_array

  end interface

end module interface_c
