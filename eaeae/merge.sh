#!/bin/bash
for ((j=1;j<=8;j++))
do
for ((i=1; i<=128; i++))
do
r=$(echo "($i+128*($j-1))" | bc)

line1="$(sed -n "${i}p" inputs${j}.txt)"
line2="$(sed -n "${r}p" outputs.txt)"
line3="$line1$line2"
echo $line3 >> final${j}.txt
done
done

