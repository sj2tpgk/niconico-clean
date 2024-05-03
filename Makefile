infile=src/all.scss
uc_template=template.css
uc_outfile=niconico-clean.user.css

compile:
	# !!! Please update @version in ${uc_template} !!!
	[ 2 -eq $$({ cat "${uc_template}"; git show HEAD:"${uc_template}"; } | grep '^@version' | uniq | wc -l) ] || { echo "ERROR: Please update @version in ${uc_template}" >&2; exit 1; }
	{ cat "${uc_template}"; echo; sassc -t compact "${infile}"; } > "${uc_outfile}"

copy:
	xclip -selection clipboard -i "${uc_outfile}"

