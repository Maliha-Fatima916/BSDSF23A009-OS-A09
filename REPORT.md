Questions


Q-1 . Compare Makefiles

Part 2: Direct compilation of all .c files into one executable.

Part 3: First compiles utility .c → .o, bundles them into libmyutils.a, then links main program with -Llib -lmyutils.

Key difference: library creation rule + linking with -l.

Q2 . Purpose of ar & ranlib

ar: Creates an archive (.a) from multiple .o files.

ranlib: Generates an index so the linker can find symbols faster.

Q3 . Running nm on client_static

If you see no separate symbols for mystrlen, etc., it means they’ve been copied directly into the executable.

This shows that static linking embeds code into the binary (unlike dynamic linking, which keeps it separate).

Q1. What is Position-Independent Code (-fPIC) and why is it required for shared libraries?
-fPIC makes machine code use relative addressing instead of absolute addresses, so the code can be loaded at any memory location. This is required for shared libraries because the OS may load them into different locations in different programs.

Q2. Explain the difference in file size between static and dynamic clients.
The static client includes a full copy of all library functions inside the executable, so it’s larger. The dynamic client only stores references to functions in the .so file, so it’s smaller.

Q3. What is the LD_LIBRARY_PATH environment variable? Why was it necessary?
LD_LIBRARY_PATH tells the OS dynamic loader where to look for shared libraries at runtime. Without setting it, the loader won’t find libmyutils.so in your project’s lib/ folder. Setting it ensures the program runs successfully.


