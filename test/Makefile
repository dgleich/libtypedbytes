

CC=$(CXX)
CXXFLAGS=-Wall -O3  -std=c++0x -I../

tests: dump_typedbytes_info write_typedbytes_test
	./write_typedbytes_test write.tb
	./dump_typedbytes_info write.tb > dump_test.cur
	diff dump_test.cur dump_test.out
	rm write.tb
	rm dump_test.cur
    
.PHONY: tests clean    
    
dump_typedbytes_info.o: ../typedbytes.hpp
write_typedbytes_test.o: ../typedbytes.hpp 

clean: 
	rm -f *.o dump_typedbytes_info write_typedbytes_test write.tb dump_test.cur
