cmake_minimum_required(VERSION 3.15)
#set(CMAKE_BUILD_TYPE Release)

project(Sandbox C Fortran)

# test de l'interfacage entre fortran et C
add_subdirectory(interface_c)

# test du scope de variable 
add_subdirectory(variable_scope)