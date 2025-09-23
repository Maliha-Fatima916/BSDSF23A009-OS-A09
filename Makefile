CC = gcc
CFLAGS = -Wall -Iinclude
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))
TARGET = bin/client

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f obj/*.o $(TARGET)

