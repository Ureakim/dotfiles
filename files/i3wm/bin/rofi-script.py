#!/bin/python

import sys, os,subprocess

def getfiles(path):
	for file in os.listdir(path):
		if file.endswith(".sh"):
			print(file)

def launchfile(filepath):
	subprocess.call([filepath])

if len(sys.argv) == 2:
	path = os.path.expanduser(os.path.normpath(sys.argv[1]))
	getfiles(path)
elif len(sys.argv) == 3:
	path = os.path.expanduser(os.path.normpath(sys.argv[1]))
	filepath = os.path.join(path, sys.argv[2])
	launchfile(filepath)
else:
	print("No script found")
