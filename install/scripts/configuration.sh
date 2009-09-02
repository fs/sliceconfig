# variables

sliceconfig=`dirname $0`/../..
sliceconfig=`readlink -f $sliceconfig`

variables=(
    CONFIG_SSH_PORT=22222
    CONFIG_ALLOW_ROOT_LOGIN=no
    # root mail
    CONFIG_ROOT_ADDRESS="notify.root@flatsoft.com"
    # where stores private files
    CONFIG_PRIVATE="user@hostname:/path/to/config/file.tar.bz2"
    )

# various functions 
function copy_file()
{
    src_file=$1
    dest_file=$2
    flag=$3
    #check variables
    if [[ (( $# -lt 3 || $flag != "copy" && $flag != "link" )) ]]; then
	echo "Usage: copy_file source_file destination_file [copy|link]"
	return 1;
    fi
    
    
    #check if file exists
    if [ -e "$dest_file" ]; then
	if [ -d "$dest_file" ]; then
	    # add filename to path
	    dest_file=$dest_file/"`basename $src_file`"
	else
	    #check for symlink
	    if [ -L "$dest_file" ]; then
		#symlink. unlink, move and delete it
		cp -L "$dest_file" "$dest_file.`date +%Y-%m-%d-%k:%M`"
		rm -f "$dest_file"
	    else
		#normal file
		mv -f "$dest_file" "$dest_file.`date +%Y-%m-%d-%k:%M`"
	    fi
	fi
    fi
    
    #create file
    if [ $flag = "copy" ];then
	cp -f "$src_file" "$dest_file"
	# replace variables
	for x in ${variables[@]}; do
	    variable=`echo $x|awk -F '=' '{print $1}'`
	    value=`echo $x|awk -F '=' '{print $2}'`
	    sed -i -e "s!$variable!$value!" $dest_file
	done
    elif [ $flag = "link" ]; then
	ln -s "$src_file" "$dest_file"
    fi
}

function get_value()
{
    key_name=$1
    for x in ${variables[@]};do
	variable=`echo $x|awk -F '=' '{print $1}'`
	value=`echo $x|awk -F '=' '{print $2}'`
	if [ $variable = $1 ];then
	    echo $value
	fi
    done
}