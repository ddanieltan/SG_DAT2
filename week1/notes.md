#for loop + print nth row
for file in *
do
  sed '1q;d' $file
done

#for loop
for ((c=1; c<=1000; c++)); do echo "hello1,hello2,hello3,hello4" >> test2.csv; done

#pipe operator + grep
cat test2.csv | cut -d "," -f1 | grep chicken
