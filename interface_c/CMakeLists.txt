#==============================================================================
# code fortran
add_library(interface_C SHARED interface_c.f90)
install(TARGETS interface_C DESTINATION lib)

target_compile_options(interface_C PRIVATE -O2
                                          -Wall
                                          -g
                                          -fPIC
                                          -Wc-binding-type
)

# code C
add_library(c_code SHARED hello.c)
install(TARGETS c_code DESTINATION lib)

#==============================================================================
# file(
#         GLOB
#         my_headers
#         *.h
# )
# #==============================================================================
# install(FILES ${my_headers}
#         DESTINATION include/${CMAKE_PROJECT_NAME})
# #==============================================================================

add_executable(interface_C.exec main.f90)
target_link_libraries(interface_C.exec interface_C)
target_link_libraries(interface_C.exec c_code)