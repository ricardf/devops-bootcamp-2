if [ $# -eq 0 ]
then
	text="Que me gusta la bash!!!!"
else	
	text=$1
fi
DUMMYDIR="foo/dummy"
EMPTYDIR="foo/empty"
FILE1="file1.txt"
FILE2="file2.txt"

mkdir -p $DUMMYDIR
touch $DUMMYDIR/$FILE1
touch $DUMMYDIR/$FILE2
echo $text > $DUMMYDIR/$FILE1
mkdir -p $EMPTYDIR
cat $DUMMYDIR/$FILE1 >> $DUMMYDIR/$FILE2
mv $DUMMYDIR/$FILE2 $EMPTYDIR/$FILE2
