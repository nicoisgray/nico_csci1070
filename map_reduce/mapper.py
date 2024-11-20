#!/usr/bin/env python
import sys

def mapper():
    """
    Reads in a sentence and maps the values.
    Mapping the values means it will give a count of 1 to every word in a sentence.

    Words are defined if there is a space between them.
    """

    #stdin = standard input
    for line in sys.stdin:
        #strip white space
        line = line.strip()

        #split into words
        words = line.split()

        for word in words:
            print(word + "\t1")
            sys.stdout.flush() #might need this line on windows machines

if __name__=='__main__':
    mapper()