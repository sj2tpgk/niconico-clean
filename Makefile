infile="src/all.scss"
outfile="all.css"

all: compile test
	echo "done"

# replaced ruby-sass with sassc
compile:
	sassc -t compact "${infile}" > "${outfile}"


compileI:
	sassc -t compact "${infile}" | sed 's/;/ \!important;/g' > "${outfile}"


copy:
	xclip -selection clipboard -i all.css


test:
	xclip -selection clipboard -i all.css
	sleep 0.05
	xdotool key --delay 50 yacute ctrl+Tab
	sleep 0.05
	xdotool click 1
	sleep 0.05
	xdotool key --delay 50 ctrl+a ctrl+v alt+shift+p ctrl+shift+Tab
