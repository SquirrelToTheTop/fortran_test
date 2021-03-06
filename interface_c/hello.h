#ifndef INTERFACE_C_HELLO
#define INTERFACE_C_HELLO

#include <stdio.h>

void bonjour_from_c(void);
// affiche la valeur du signed char
void print_int1(const signed char *sa);

// affiche la valeur du short int
void print_int2(const short int *si);

// affiche la valeur du short int
void print_int4(const int *i);

// affiche la valeur float
void print_float(const float *);

// affiche la valeur double
void print_double(const double *);

// affiche le contenu d'un tableau 1D
void print_array_int1(signed char *, const int);

// compute the sum of array element return it
int compute_sum(signed char *, const int);

// return and array to Fortran
int * create_1D_array(const int);

#endif
