Questions


Compare Makefiles

Part 2: Direct compilation of all .c files into one executable.

Part 3: First compiles utility .c → .o, bundles them into libmyutils.a, then links main program with -Llib -lmyutils.

Key difference: library creation rule + linking with -l.

Purpose of ar & ranlib

ar: Creates an archive (.a) from multiple .o files.

ranlib: Generates an index so the linker can find symbols faster.

Running nm on client_static

If you see no separate symbols for mystrlen, etc., it means they’ve been copied directly into the executable.

This shows that static linking embeds code into the binary (unlike dynamic linking, which keeps it separate).

