#!/bin/bash
sleep 10
epiphany --application-mode --profile="/home/blacky/.config/epiphany/app-epiphany-gmail-eabdf94e13996f57a124d22f8d5b1fda50156307" https://accounts.google.com/ServiceLogin?service=mail&passive=true&rm=false&continue=https://mail.google.com/mail/&ss=1&scc=1&
epiphany --application-mode --profile="/home/blacky/.config/epiphany/app-epiphany-inmar-60ceed9189cdb6b2a149575a33347b9315949c92" https://accounts.google.com/ServiceLogin?service=mail&passive=true&rm=false&continue=https://mail.google.com/mail/&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1#
kdocker -i /data/Pictures/Downloads/gmail.png -o -t -n 'Gmail' &
kdocker -i /data/Pictures/Downloads/inmar.jpg -o -t -n 'Inmar' &
