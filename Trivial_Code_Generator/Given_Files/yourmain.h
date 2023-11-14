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
    SR -= 8;
    FR = SR;
    FR += 4;
    FR = FR >> 1;
    R[1] = 2;
    Mem[SR+1] = R[1];
    R[2] = 3;
    Mem[SR+2] = R[2];
    R[1] = Mem[SR+1];
    R[2] = Mem[SR+2];
    R[3] = R[1] + R[2];
    Mem[SR] = R[3];
    F[1] = 3.1415;
    FMem[FR+1] = F[1];
    R[1] = Mem[SR+2];
    F[1] = (double)R[1];
    F[2] = FMem[FR+1];
    F[3] = F[1] * F[2];
    FMem[FR] = F[3];
    print_string( "a = " );
    print_int( Mem[SR] );
    print_string( "\nb = " );
    print_int( Mem[SR+1] );
    print_string( "\nc = " );
    print_int( Mem[SR+2] );
    print_string( "\nx = " );
    print_double( FMem[FR] );
    print_string( "\nx = " );
    print_double( FMem[FR+1] );
    SR += 8;
    return 0;
}
