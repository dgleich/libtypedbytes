
CXXFLAGS += -Wall -O3 -fPIC

LIBNAME=libtypedbytes.a

all: $(LIBNAME) 

.PHONY: lib tests clean

$(LIBNAME): typedbytes.o typedbytes.h
	$(AR) rvs $(LIBNAME) typedbytes.o

clean: 
	rm -rf *.o $(LIBNAME)
	cd test; make $(MFLAGS) clean

tests:
	cd test; make $(MFLAGS)
