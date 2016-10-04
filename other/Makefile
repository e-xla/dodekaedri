test: dsptest
	./dsptest > out

dsptest: dsptest.c
	gcc $^ -o $@ -Wall -Wextra -lm -O3

.PHONY: test
