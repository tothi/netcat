# makefile for Kali linux (using official mingw64)
#

CC = /usr/bin/i686-w64-mingw32-gcc

CFLAGS = -c -O3 -march=i686 -DWIN32 -DNDEBUG -D_CONSOLE -DTELNET -DGAPING_SECURITY_HOLE
LFLAGS = -o nc.exe -O3 -march=i686 -Wl,-lkernel32,-luser32,-lwinmm,-lws2_32

all: nc.exe

getopt.o: getopt.c
	$(CC) $(CFLAGS) getopt.c

doexec.o: doexec.c
	$(CC) $(CFLAGS) doexec.c

netcat.o: netcat.c
	$(CC) $(CFLAGS) netcat.c

nc.exe: getopt.o doexec.o netcat.o
	$(CC) getopt.o doexec.o netcat.o $(LFLAGS)
	strip nc.exe

clean:
	rm -f getopt.o doexec.o netcat.o nc.exe
