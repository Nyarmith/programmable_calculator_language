# Makefile: A simple makefile for ex1.
default:
	bison -d calc.ypp
	flex calc.l
	g++ -std=c++11 -g -o mycalc -fpermissive calc.tab.cpp calc.yy.c