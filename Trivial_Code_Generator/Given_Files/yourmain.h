/***************************************************************************** 
 *
 * An empty yourmain() function.
 * Written by Craig C. Douglas
 *
 * The main program in f23.c calls a user supplied your_main function that is
 * included in this compilation through a #include directive.
 *
 *****************************************************************************/

int yourmain()
{
    SR -= 1;
    R[1] = 441;
    Mem[SR+1] = R[1];
    print_int(Mem[SR+1]);
    return 0;
}
