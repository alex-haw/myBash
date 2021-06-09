#[user@host] $
#PS1="\e[0;29m\u@\h\$\e[m "
PS1="\e[0;29m\u\$\e[m "

#for running programs
alias netbeans="/bin/sh \"/usr/local/netbeans-12.3/netbeans/bin/netbeans\""
alias android-studio="sh /home/alex/my/android/android-studio/bin/studio.sh"
#edit this file and enable
alias mybash="nano /home/alex/.bash_aliases && source /home/alex/.bashrc"

#prints a pink debian logo
function deb_ascii(){
	tput setaf 6
	echo -e "   session at $(date +'%s')\n"
	tput setaf 5
	echo -e "\t  g#M*MWw"
	echo -e "\tjR   -  1R"
	echo -e "\t]   =    R"
	echo -e "\t1,  \`>~*^"
	echo -e "\t Y="
	echo -e "\t   *~\n"
	tput sgr0
}

function meat(){

	echo "       _                                            _                  ______     _     _             "
	echo "      | |              ____                        | |                 |  _  \\   | |   (_)            "
	echo "  __ _| | _____  __   / __ \\   _ __ ___   ___  __ _| |_    ___  _ __   | | | |___| |__  _  __ _ _ __  "
	echo " / _\` | |/ _ \\ \\/ /  / / _\` | | '_ \` _ \\ / _ \\/ _\` | __|  / _ \\| '_ \\  | | | / _ \\ '_ \\| |/ _\` | '_ \\ "
	echo "| (_| | |  __/>  <  | | (_| | | | | | | |  __/ (_| | |_  | (_) | | | | | |/ /  __/ |_) | | (_| | | | |"
	echo " \\__,_|_|\\___/_/\\_\\  \\ \\__,_| |_| |_| |_|\\___|\\__,_|\\__|  \\___/|_| |_| |___/ \\___|_.__/|_|\\__,_|_| |_|"
	echo "                      \\____/"
}
#gives info about current session
#working directory, time, date
function info(){
	INOW="$(date +'%t%R%t%x')"	
	ENOW="$(date +'%s')"
	tput setaf 6; echo -n $(pwd)
        tput setaf 1; echo "$INOW"
	tput sgr0
}

#tree to enhance ls
#ls		show wd
#ls -a		show all in wd
#ls somedir	shows somedir
#ls somedir -a	shows all in somedir
alias ls="treeLs"
function treeLs(){
	clear
	OLDIR=$(pwd)
	if [[ -z "$1" ]]; then 
		info
		tree -L 1 --noreport | sed -n '1!p' | more
	elif [[ $1 = "-a" ]]; then
		info
		tree -L 1 --noreport -a | sed -n '1!p' | more
	elif [[ $2 = "-a" ]]; then
		cd $1; info
		tree -L 1 --noreport -a | sed -n '1!p' | more
	else
		cd $1; info
		tree -L 1 --noreport | sed -n '1!p' | more
	fi
	cd $OLDIR

}

alias cd="cd"
function treeCd(){
	cd $1
	clear
	treeLs $(pwd)
}
#alias cd="treeCd"

#edit a .py file then run autopep to fix formatting
function pynano(){
	nano $1 && autopep8 $1 --in-place
}

#disable caps lock
xmodmap -e "keycode 66 = Shift_L NoSymbol Shift_L"

#makes a pointless loading bar
#$1	label string
#$2	delay between #s in seconds
#$3	finished label string
function printLoadingBar(){
	for i in $(seq 1 20); do
		echo -en $1
		sleep $2
		echo -en ' '$i'0% '
		for j in $(seq 1 $i); do
			echo -n '#'
		done
		echo -en '\r'
	done
	echo -e '\t\t\t\t['$3']'
}

#
function gitup(){
	git add *
	git commit -m "$1"
	git push
}

#to run on new terminal with above
ls
