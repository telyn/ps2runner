.PHONY: install
test-program: test-program.o libps2run.a
	ee-gcc -Wl,--wrap=main $^ -o $@

install: libps2run.a
	cp $^ $(PS2DEV)/ee/lib

libps2run.a: ps2run_exit.o
	ee-ar rcsu $@ $^

%.o: %.c
	ee-gcc -c $< -o $@
