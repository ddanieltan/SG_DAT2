# -*- coding: utf-8 -*-
"""
Created on Wed Aug 4

@author: sinanozdemir
adapted from https://www.wakari.io/sharing/bundle/nkorf/MapReduce%20Example
"""

# this function should turn a string into a list of (word, 1)
def mapper(line):
    result = []
    tokenize = line.split(" ")
    for word in tokenize:
        result.append((word,1))
    return result
    # output is a list of (key, value) pairs

mapper("Hi everyone Hi Hi")
# [('Hi', 1), ('everyone', 1), ('Hi', 1), ('Hi', 1)]
# note that duplicates are expected



# the shuffle function gathers up the like key words
# once it gathers them up, it calls the reduce function!
# I have sorted everything by key for you
# run through the words one by one and create a dictionary
# where the word is the key and the value is the total count
# this is essentially a rehashed Counter but our own :)
# You can print out the results instead of returning them
# As long as the count is clear

from collections import defaultdict
def reducer(words):
    dictionary = defaultdict(int) 
    for i,j in words:
        dictionary[i] += 1
    for k,v in dictionary.iteritems():
        print k,v


reducer([('Hi', 1), ('everyone', 1), ('Hi', 1), ('Hi', 1), ('sinan', 1), ('sinan', 1)])
# Hi 3
# everyone 1
# sinan 2


sentences = ['hello big data big big big data',
             'big data is the best',
             'big data is the best data big',
             'hello big data how are data',
             'big big big data',
             'data data big big']
# list of sentences to analyze

# TODO run map reduce on sentences
everything = []
for sentence in sentences:
    mapped = mapper(sentence)
    for i in mapped:
        everything.append(i)
reducer(everything)

# TODO run MR on a scraped web document (relatively big doc)
