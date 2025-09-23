Questions

Q-1 . The linking rule in this part's Makefile:

$(TARGET): $(OBJECTS)

This means: to build the final program (the target), we need all the compiled object files (.o).

The Makefile rule then runs the linking step, which combines the object files into a single executable.

Difference from linking with a library:

Here, the linker directly combines all .o files into the final program.

When using a library, you don’t list every .o file; instead, you link against a pre-built .a (static) or .so (dynamic) library using -l and -L flags. The library hides all the object files inside i


Q-2. What is a git tag and why is it useful in a project?

A git tag is like a bookmark that marks a specific commit in project’s history (e.g., “Version 1.0”).

It is useful because it helps developers and users:

Identify stable points in the project.

Revisit or download exact versions later.

Mark releases clearly without guessing which commit is important.

Difference between simple tag and annotated tag:

Simple (lightweight) tag: Just a name pointing to a commit (like a quick label).

Annotated tag: Contains extra information like author, date, and a message. These are recommended for official releases because they store more context

Q-3 .  What is the purpose of creating a "Release" on GitHub?

A GitHub Release is a user-friendly package of a specific version of a project.

Purpose:

Makes it easy for users to download stable versions without using git commands.

Provides release notes (what changed, new features, etc.).

Organizes project history into clear milestones.

Significance of attaching binaries (like bin/client):

Saves users from compiling the project themselves.

They can directly download and run the program.

This is especially useful for non-developers or those who just want to use the software


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



