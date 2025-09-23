CC = gcc
CFLAGS = -Wall -Iinclude -fPIC
SRC = src/myfilefunctions.c src/mystrfunctions.c
OBJ = $(SRC:.c=.o)

# Directories
BIN_DIR = bin
LIB_DIR = lib

# Targets
all: client_static client_dynamic

# 1. Build static library
$(LIB_DIR)/libmyutils.a: $(OBJ)
	ar rcs $@ $^

# 2. Build dynamic library
$(LIB_DIR)/libmyutils.so: $(OBJ)
	$(CC) -shared -o $@ $^

# 3. Build static client (links with .a)
client_static: $(LIB_DIR)/libmyutils.a src/main.c
	$(CC) -Wall -Iinclude -L$(LIB_DIR) -o $(BIN_DIR)/$@ src/main.c -lmyutils

# 4. Build dynamic client (links with .so)
client_dynamic: $(LIB_DIR)/libmyutils.so src/main.c
	$(CC) -Wall -Iinclude -L$(LIB_DIR) -o $(BIN_DIR)/$@ src/main.c -lmyutils

# 5. Clean up
clean:
	rm -f src/*.o $(BIN_DIR)/* $(LIB_DIR)/*.a $(LIB_DIR)/*.so

