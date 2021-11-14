if [ "$#" -ne 2 ]; then
  echo "Se requieren 2 parametro para la ejecucción del script (palabra a buscar y web), ej: sh ./4-download.sh google https://www.google.com"
  exit 1
fi
wget -qO- $2 | grep -na $1 | head -n 1 | awk -F ':' '{print $1}'