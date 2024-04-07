#/usr/bin/sh

[ $# -ne 2 ] && { echo "Usage: ./screenshot.sh URL OUTPUT"; exit 1; }

out=$1
url=$2
firefox -P ss --headless --window-size 1024,768 --screenshot "$url"
mv screenshot.png "$out"
