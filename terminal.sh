#!/bin/bash

if [ "x$1" != "x" ]; then
   if [ $1 == "ls" ]; then
      docker ps
   else
      [ "x$2" != "x" ] && shell="$2" || shell="bash"
      docker exec -ti $1 $shell
   fi
else
   echo "usage terminal [container | ls]"
fi
