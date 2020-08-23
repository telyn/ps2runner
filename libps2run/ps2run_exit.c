#include <stdio.h>

void ps2run_exit(int exitCode) {
	printf("\nlibps2run ret %d\n", exitCode);
}

int __real_main(int argc, char **argv);

int __wrap_main(int argc, char **argv) {
	int res = __real_main(argc, argv);
	ps2run_exit(res);
	return res;
}
