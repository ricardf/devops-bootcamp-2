wget -qO- www.google.com | grep -nar $1 | head -n 1 | awk -F ':' '{print $2}'
