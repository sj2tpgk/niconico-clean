infile="src/all.scss"
uc_template="uc-template.css"
uc_outfile="niconico-clean.user.css"

compile:
	# !!! Please update VERSION in ${uc_template} !!!
	{ cat "${uc_template}"; echo; sassc -t compact "${infile}"; } > "${uc_outfile}"

copy:
	xclip -selection clipboard -i "${uc_outfile}"

