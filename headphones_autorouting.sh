#!/bin/bash
coproc acpi_listen
trap 'kill $COPROC_PID' EXIT

while read -u "${COPROC[0]}" -a event; do
	if [ "${event[0]}" = 'jack/headphone' ]
	then
		if [ "${event[2]}" = 'plug' ]
		then
			pacmd set-card-profile 1 output:iec958-stereo+input:analog-stereo
		elif [ "${event[2]}" = 'unplug' ]
		then
			pacmd set-card-profile 1 output:analog-stereo+input:analog-stereo
		fi
	fi
done
