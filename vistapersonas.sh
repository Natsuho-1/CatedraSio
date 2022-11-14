#!/bin/bash
while IFS= read line
do
echo "$line"
done < tbl_persona.txt
