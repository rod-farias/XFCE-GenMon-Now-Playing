#!/bin/bash
#xfce4-genmon-now-playing
#
#Simple plugin for XFCE4 Panel that allows you to present playing music info in flat text mode and switch pause/play.
#https://github.com/rod-farias/xfce-genmon-now-playing

playerctl_status=$(playerctl status)
if [[ $playerctl_status = 'Playing' || $playerctl_status = 'Paused' ]]; then
	progress_bar_width=20
	title_width=40
	song_length=$(playerctl metadata mpris:length)
	
	if [[ ${#song_length} -gt 6 ]]; then

		#icon in the left of progress bar
		player_icon=''
		if [[ $playerctl_status = 'Playing' ]]; then
			player_icon='⏵'
		else
			player_icon='⏸'
		fi

		#progress bar
		position=$(playerctl position)
		position2=${position/.*/}
		song_length2=${song_length::-6}
		progress=$(($position2 * $progress_bar_width / $song_length2))
		remaind=$(($progress_bar_width - $progress))

		progress_bar=$(printf '%0.s|' $(seq 1 $progress))
		progress_bar+=$(printf '%0.s.' $(seq 1 $remaind))
		progress_bar=${progress_bar::-1}

		#time indicator
		time_indicator=$(playerctl metadata --format "{{duration(position)}} / {{duration(mpris:length)}}")
		
		#title
		album=$(playerctl metadata --format " - {{album}}")
		title=$(playerctl metadata --format "{{title}} - {{artist}}")
		if [[ $album != ' - ' ]]; then
			title+="${album}"
		fi
		real_width=${#title}
		if [[ $real_width -gt $title_width ]]; then
			title=${title:0:title_width}
		else
			remaind=$(($title_width-$real_width))
			title+=$(printf '%0.s ' $(seq 1 $remaind))
		fi

		#output
		echo "<txt>${player_icon} |${progress_bar}|  ${time_indicator}  |  ${title}</txt>"
		echo "<txtclick>playerctl play-pause</txtclick><tool></tool>"
	else
		echo ""
	fi
else
    echo ""
fi
