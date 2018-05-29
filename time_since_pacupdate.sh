#!/bin/sh
i=$(($(date +%s) - $(date -r /var/log/pacman.log +%s)))
((days=i/86400, i-=days*86400, hrs=i/3600, i-=hrs*3600, min=i/60, i-=min*60, sec=i))
printf "%dd %02dh %02dm %02ds" $days $hrs $min $sec

