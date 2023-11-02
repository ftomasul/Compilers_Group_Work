###############################################################################
#
#   Sample Makefile
#
###############################################################################

SHELL = /bin/sh
CC = gcc
EXECUTABLE = f23

all:Makefile f23.c yourmain.h
	$(CC) -o $(EXECUTABLE) f23.c -lm
	$(EXECUTABLE) | tee zzz

help:
	@echo 'Your options are the following:'
	@echo "    make help"
	@echo "        Print a help message"
	@echo "    make all"
	@echo "        Makes the simple example program and runs it"
	@echo "    make clean"
	@echo "        Removes extra files, but leaves f23.c intact"

clean:
	rm -f $(EXECUTABLE) zzz

###############################################################################
#
# C'est finis
#
###############################################################################
