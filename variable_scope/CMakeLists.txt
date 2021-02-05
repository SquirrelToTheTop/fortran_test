#==============================================================================
add_library(variable_scope SHARED module_1.f90)

target_compile_options(variable_scope PRIVATE -O2
                                              -Wall
                                              -g
                                              -fPIC
)

install(TARGETS variable_scope
        DESTINATION lib)
#==============================================================================
# file(
#         GLOB
#         my_headers
#         *.h
# )
#==============================================================================
# install(FILES ${my_headers}
#         DESTINATION include/${CMAKE_PROJECT_NAME})
#==============================================================================

add_executable(variable_scope.exec main.f90)

target_link_libraries(variable_scope.exec variable_scope)