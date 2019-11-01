#!/bin/bash
echo begin 

# restart ssh for log
service ssh restart

#run something 
tail -f /dev/null

echo end 
