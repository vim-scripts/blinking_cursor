/*
 * An extremely simple program to make sure that the cursor is
 * displayed after the killing of vimblinkcursor.
 */

#include <stdio.h>

main()
{
		printf("\e[?25h");
		fflush(stdout);
        return 0;
}
