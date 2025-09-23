#include <stdio.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");
    char str1[100] = "Hello";
    char str2[100] = " World";

    printf("Length of str1: %d\n", mystrlen(str1));
    mystrcat(str1, str2);
    printf("Concatenated: %s\n", str1);

    char copy[100];
    mystrcpy(copy, str1);
    printf("Copied string: %s\n", copy);

    char copyN[100];
    mystrncpy(copyN, str1, 5);
    printf("Copied first 5 chars: %s\n", copyN);

    printf("\n--- Testing File Functions ---\n");
    FILE* f = fopen("../test.txt", "r");
    if (f) {
        int lines, words, chars;
        wordCount(f, &lines, &words, &chars);
        printf("Lines: %d, Words: %d, Characters: %d\n", lines, words, chars);

        char** matches;
        int count = mygrep(f, "test", &matches);
        printf("Found %d matches:\n", count);
        for (int i = 0; i < count; i++) {
            printf("%s", matches[i]);
        }
        fclose(f);
    } else {
        printf("File not found.\n");
    }

    return 0;
}
