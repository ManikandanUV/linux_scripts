#!/bin/bash

HOUR=$(date -d now +%H)

if [ $HOUR -gt 22 ] || [ $HOUR -lt 7 ] 
then
	xbacklight -set 0
else
	xbacklight -set 70	
fi
