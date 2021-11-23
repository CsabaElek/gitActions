#!/bin/bash


path=`find . -type f -name "maintenance-page.html"`
path_error=`find . -type f -name "error-page.html"`
echo $path

for i in $path
do
        a=`echo $i | cut -d "/" -f 2`
        echo "This is the brand: $a"
        sed -i 's/=".\//="\/maintenance-pages\/'$a'\//g' $i
        echo "done"
done

for i in $path_error
do
        a=`echo $i | cut -d "/" -f 2`
        echo "This is the brand: $a"
        sed -i 's/=".\//="\/maintenance-pages\/'$a'\//g' $i
        echo "done"
done
