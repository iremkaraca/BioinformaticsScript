#!/usr/bin/env python3
from collections import defaultdict
import sys,time
print("Start: %s" % time.ctime())

file1 = open(sys.argv[1])
file2 = open(sys.argv[2])

hash = defaultdict(list)
for line in file1:
    list = line.split()
    #key = list[1], value = list[0]
    hash[list[1]].append(list[0])

for line in file2:
    list2= line.split()
    #print(list2[0],list2[1])
    if list2[0] in hash.keys():
        for values in hash[list2[0]]:
            print(values,line, end="")
        

print("End: %s" % time.ctime())

