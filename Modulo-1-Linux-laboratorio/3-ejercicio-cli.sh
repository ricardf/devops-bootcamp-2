text="Que me gusta la bash!!!!"
if [ $# -gt 1 ]; then
  echo "El script como máximo 1 parametro (valor a guardar en el fichero). default: Que me gusta la bash!!!!"
  exit 1
elif [ $# -eq 1 ]; then	
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