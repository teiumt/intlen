DESTDIR=/usr/local
all:
	g++ -c -Wall -std=c++11 -o src/intlen.o src/intlen.cpp
	cp src/intlen.hpp inc
	ar rcs lib/libintlen.a src/intlen.o
	g++ -Wall -std=c++11 -o bin/intlen intlen.cpp -lintlen -Llib
clean:
	rm -f lib/*.a
	rm -f bin/*
	rm -f src/*.o
	rm -f inc/*.hpp
install:
	mkdir -p $(DESTDIR)/bin
	mkdir -p $(DESTDIR)/include
	mkdir -p $(DESTDIR)/lib
	cp bin/intlen $(DESTDIR)/bin/intlen
	cp inc/intlen.hpp $(DESTDIR)/include/intlen.hpp
	cp lib/libintlen.a $(DESTDIR)/lib/libintlen.a
remove:
	rm -f $(DESTDIR)/bin/intlen
	rm -f $(DESTDIR)/include/intlen.hpp
	rm -f $(DESTDIR)/lib/libintlen.a
