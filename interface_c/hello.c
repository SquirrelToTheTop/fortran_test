#include "hello.h"

void bonjour_from_c(void){
	fprintf(stdout, "\t> Hello from C code \n");
}

// ---------------------------------------------------------------------
// Print single variable  ----------------------------------------------
// --------------------------------------------------------------------- 

// affiche la valeur du signed char
void print_int1(const signed char *sa){
  fprintf(stdout, "\t> [C Side] received signed char %hhd (%lu bytes) \n", 
          *sa, sizeof(*sa));
}

// affiche la valeur du short int
void print_int2(const short int *si){
  fprintf(stdout, "\t> [C Side] received short int %i (%lu bytes)\n", 
          *si, sizeof(*si));
}

// affiche la valeur du int
void print_int4(const int *i){
  fprintf(stdout, "\t> [C Side] received int %d (%lu bytes)\n", 
          *i, sizeof(*i));
}

// affiche la valeur du int
void print_int8(const long int *li){
  fprintf(stdout, "\t> [C Side] received long int %ld (%lu bytes)\n",
         *li, sizeof(*li));
}

// affiche la valeur du float
void print_float(const float *f){
  fprintf(stdout, "\t> [C Side] received float %f (%lu bytes)\n", 
          *f, sizeof(*f));
}

// affiche la valeur du double
void print_double(const double *d){
  fprintf(stdout, "\t> [C Side] received double %lf (%lu bytes) \n", 
          *d, sizeof(*d));
}

// ---------------------------------------------------------------------
// Print 1D array ------------------------------------------------------
// --------------------------------------------------------------------- 

// affiche la valeur du signed char
void print_array_int1(signed char *arr, const int arr_size ){
  fprintf(stdout, "\t> [C Side] received array of %d signed char\n", 
          arr_size);
  
  fprintf(stdout, "\t> [C Side] received :");
  for(int i=0; i<arr_size; ++i){
    fprintf(stdout, " %2hhd", arr[i]);
    arr[i] ++;
  }
  fprintf(stdout, "\n");
}

// ---------------------------------------------------------------------
// Operation on 1D array and return value ------------------------------
// --------------------------------------------------------------------- 
int compute_sum(signed char *arr, const int arr_size){
  
  int sum = 0;

  for(int i=0; i<arr_size; ++i){
    sum += (int) arr[i];
  }

  return sum;
}

// ---------------------------------------------------------------------
// Return 1D array to Fortran ------------------------------------------
// ---------------------------------------------------------------------
int * create_1D_array(const int nelems){

  int *arr = (int *) malloc(sizeof(int)*nelems);

  for(int i=0; i<nelems; ++i){
    arr[i] = i*2;
  }

  return arr;
}

// free allocated memory on C side
void free_1D_array(int *p){
  free(p);
}