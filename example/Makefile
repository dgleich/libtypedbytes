CC=$(CXX)
CXXFLAGS=-Wall -O3  -std=c++0x -I../ -L../

all: word_count colsums

word_count: word_count.o ../libtypedbytes.a
colsums: colsums.o ../libtypedbytes.a

.PHONY: all clean tests test_tsqr

clean:
	rm -rf typedbytes.o dump_typedbytes_info.o dump_typedbytes_info


