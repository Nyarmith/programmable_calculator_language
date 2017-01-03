# Makefile: A simple makefile for ex1.
default:
	bison -d calc.ypp
	flex calc.l
	g++ -std=gnu++11 -g -o mycalc -fpermissive calc.tab.cpp lex.yy.c
clean:
	rm calc.tab.cpp lex.yy.c calc.tab.hpp
