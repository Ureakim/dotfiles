#!/bin/bash

while getopts p:c:n: flag
do
	case "${flag}" in
		p) process=${OPTARG};;
		c) command=${OPTARG};;
		n) appname=${OPTARG};;
	esac
done

if pgrep -xa "${process}" | grep "${command}"  >/dev/null
then
	i3-msg "[title=\"${appname}\"]" scratchpad show
else
	$command &
	i3-msg -t subscribe  '[ "window" ]'
	i3-msg "[title=\"${appname}\"]" move scratchpad
	i3-msg "[title=\"${appname}\"]" scratchpad show
fi

