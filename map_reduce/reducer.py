#!/usr/bin/env python

import sys

def reduce_mapped():
    """
    Reduce the mapped values.
    Add up words that are the same.
    """

    current_word = None
    current_count = 0

    #loop through the lines passed in from mapper.py
    for line in sys.stdin:
        line = line.strip()
        word, count = line.split("\t",1)
        count = int(count)

        if current_word == word:
            current_count += count
        else:
            #if there is a current word that is not none or not the same as the word we're currently on
            if current_word:
                print(current_word + "\t" + str(current_count))
            current_count = count
            current_word = word
    if current_word == word:
        print(current_word + "\t" + str(current_count))
        sys.stdout.flush()

if __name__ == "__main__":
    reduce_mapped()