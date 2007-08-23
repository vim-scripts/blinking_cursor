/*
 * An extremely simple program to make the cursor blink in an xterm.
 * This is useful when the cursor is hard to spot in a highlighted file.
 * Start in the background: "vimblinkcursor&"  Stop by killing it.
 * Based on blink by Bram Moolenaar (based on an idea from John Lange)
 * _actually the only difference is the name of the program...
 */

#include <stdio.h>

main()
{
	while (1)
	{
		printf("\e[?25h");
		fflush(stdout);
		usleep(400000);		/* on time */
		printf("\e[?25l");
		fflush(stdout);
		usleep(250000);		/* off time */
	}
}
