#!/bin/bash
if [ ! -e ../$0 ]; then
   echo ERROR: ../$0.sh does not exist. 
   exit 1
fi

../$0 $(pwd)

