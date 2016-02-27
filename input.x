struct result_t
{
  int          integer_part;
  unsigned int decimal_part;
};

program ARITHMETIC_PROGRAM
{
  version ARITHMETIC_VERSION
  {
    /* Return the integer part and the 1000th of the
       given double-precision floating point number.  */
    result_t split_number (double) = 1;
  } = 0;
} = 80000;

