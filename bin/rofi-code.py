#!/bin/python

import sys, os,subprocess

def getworkspaces(path):
	for file in os.listdir(path):
		if file.endswith(".code-workspace"):
			print(file)

def launchworkspaces(filepath):
	subprocess.call(["codium", filepath])
	

if len(sys.argv) == 2:
	path = os.path.expanduser(os.path.normpath(sys.argv[1]))
	getworkspaces(path)
elif len(sys.argv) == 3:
	path = os.path.expanduser(os.path.normpath(sys.argv[1]))
	filepath = os.path.join(path, sys.argv[2])
	launchworkspaces(filepath)
else:
	print("No projects found")
