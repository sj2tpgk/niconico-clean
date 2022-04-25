infile="src/all.scss"
uc_template="uc-template.css"
uc_outfile="niconico-clean.user.css"

all: compile test
	echo "done"

# replaced ruby-sass with sassc
compile:
	{ cat "${uc_template}"; echo; sassc -t compact "${infile}"; } > "${uc_outfile}"


copy:
	xclip -selection clipboard -i "${uc_outfile}"


test:
	xclip -selection clipboard -i all.css
	sleep 0.05
	xdotool key --delay 50 yacute ctrl+Tab
	sleep 0.05
	xdotool click 1
	sleep 0.05
	xdotool key --delay 50 ctrl+a ctrl+v alt+shift+p ctrl+shift+Tab
