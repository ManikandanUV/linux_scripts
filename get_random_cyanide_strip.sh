#!/bin/sh
cd /home/blacky/PycharmProjects/CyanideExtractor/
./venv/bin/python get_random_comic_strip.py 
convert -resize 800x500 /home/blacky/comics/cyanide/random.png /home/blacky/comics/cyanide/random.png

