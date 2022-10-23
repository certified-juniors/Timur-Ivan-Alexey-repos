.PHONY: all build rebuild check test testextra memtest memtestextra clean

all: clean check build test memtest testextra memtestextra

memtest:
	./memtest/memtest.sh
	
