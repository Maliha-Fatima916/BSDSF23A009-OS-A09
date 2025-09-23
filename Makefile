CC = gcc
CFLAGS = -Wall -Iinclude

SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))
LIBOBJ = obj/mystrfunctions.o obj/myfilefunctions.o
LIB = lib/libmyutils.a
TARGET = bin/client_static

all: $(LIB) $(TARGET)

# Build static library
$(LIB): $(LIBOBJ)
	ar rcs $@ $^
	ranlib $@

# Build main program linking against static lib
$(TARGET): obj/main.o $(LIB)
	$(CC) $(CFLAGS) -o $@ obj/main.o -Llib -lmyutils

PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man3


install:
	sudo cp bin/client /usr/local/bin/client
	sudo cp man/man3/mycat.1 /usr/local/share/man/man3/
	sudo gzip -f /usr/local/share/man/man3/mycat.1


# Compile all .c files into .o
obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f obj/*.o $(TARGET) $(LIB)


