#!/bin/bash
##########################################################
## This script is here to make adding/subtracting users ##
## to the smbpasswd file easyer etc.				 ##
##########################################################

NO_ARGS=2
E_OPTERROR=65

operation=0 # 1 = add
		# 2 = del
		# 0 = error.
fillel=0	# 1 = good file and file location.
		# 0 = error
#########################################################
## Parameters:		    	    	   ##
## -o [options] = The operation to preform. Options are##
##				 as follows:					 ##
##				 add = add users to the system	 ##
##				 del = delete users from the system.##
## -f [file_location] = The file that the user names  ##
##					 are stored in. must provide ##
##					 the compleate location of the ##
##					 file.						 ##
#########################################################


#protect outselfs from passing nothing to the script.
if [ "$#" -eq "$NO_ARGS" ]
then	#script needs at least 3 options passed to it, otherwise error out and do nothing.
	echo "Usage: $0 -[switch] [option/file_location]"
	exit $E_OPTERROR
fi

while getopts o:f: Option
do
	case "$Option" in
		o)
			#check the option and fill the operation var.
			if [ "$OPTARG" == "add" ]
			then
				#we are going to add the users.
				operation=1
			elif [ "$OPTARG" == "del" ]
			then
				#we are deleting the users.
				operation=2
			else
				#error out, cause they didn't pass the right option.
				operation=0
				echo "Invaild operation option!"
				exit $E_OPTERROR
			fi
		;;
		f)
			#check the option to see if the file exsists and that it is none zero.
			if [ -f "$OPTARG" ]
			then
				if [ -s "$OPTARG" ]
				then
					filel=1
					filelocation="$OPTARG"
				else
					filel=0
		 		echo "File is of zero length! You need to have a list of users in the file!"
					exit $E_OPTERROR
				fi
			else
				filel=0
		 	echo "File isn't there! You must provide a vlid file location!"
				exit $E_OPTERROR
			fi
		;;
		*)
			break
		;;
	esac

done
shift $(($OPTIND - 1))

if [ $operation == 1 ]
then
	#we are adding the users.
	for i in $(cat "$filelocation")
	do
		username=$(echo "$i" | cut -d':' -f1)
		password=$(echo "$i" | cut -d':' -f2)
		expect /scripts/provision/smbpasswd_wrapper.sh $username $password
		smbpasswd -e $username
	done
elif [ $operation == 2 ]
then
	#we are deleting the users out of the system.
	for i in $(cat "$filelocation")
	do
		username=$(echo "$i" | cut -d':' -f1)
		smbpasswd -x $username
	done
fi

exit 0
