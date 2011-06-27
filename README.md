libtypedbytes 
=============

By David F. Gleich, based on TypedBytes for python by [Klaas Bosteels][klass],
and typedbytes in Hadoop by [Brandyn White][brandyn].

This library implements readers and writers for the 
[TypedBytes codes][typedbytes] in C++.  It was originally developed 
for the [mrtsqr][] project, but should be independently useful.

Usage
-----

Let's suppose we have a typed bytes file has an integer for a header,
a sequence of strings, and a map of strings to integers.  For fun,
let's pretend the sequence has a list of directory names, and the
map is a list of filenames and their filesizes.

    FILE* f = fopen("myfile.tb","r")
    TypedBytesInFile tb(f);
    assert(tb.next_type() == TypedBytesInteger)
    int header = tb.read_int();
    assert(tb.next_type() == TypedBytesList);
    while (tb.next_type() != TypedBytesListEnd) {
        std::string dirname;
        // we already read the typecode, so use lastcode here instead
        assert(tb.lastcode == TypedBytesString);
        tb.read_string(&dirname);
    }
    // notice that we already read the typecode
    assert(tb.lastcode == TypedBytesMap)
    int maplen = tb.read_typedbytes_sequence_length();
    for (int i=0; i<maplen; ++i) {
        assert(tb.next_type() == TypedBytesString)
        std::string filename;
        tb.read_string(&filename);
        // allow promotion of bool, char, and integers to full ints
        assert(tb.can_be_int(tb.next_type()));
        int size = tb.convert_int();
        
    }
    
Building
--------

The makefile is setup to build `libtypedbytes.a`
    
Linking
-------

### Easy link

If you just have a simple script, then the `typedbytes.hpp` include
will package everything together for you.  Just include this file,
and you are ready to go!

[typedbytes]: https://issues.apache.org/jira/browse/HADOOP-1722 "Typed bytes"
[klass]: https://github.com/klbostee "Klass Bosteels"
[brandyn]: https://github.com/bwhite "Brandyn White"
[dumbo]: https://github.com/klbostee/dumbo "dumbo"
[hadoopy]: https://github.com/bwhite/hadoopy "hadoopy"
[mrtsqr]: https://github.com/dgleich/mrtsqr "Tall and Skinny QR factorizations in MapReduce"
