module module_1
    implicit none 

    integer :: ncells

    contains 

    subroutine patator()
        implicit none

        integer :: ncells

        write(*,*) "> Value of ncells in patator() : " , ncells
         
    end subroutine 

end module module_1