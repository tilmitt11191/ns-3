
#!/bin/bash
export LANG=C

LOG_FILE="$(cd $(dirname $0) && pwd)/var/log/log"
LOG_LEVEL="DEBUG"

function rotate_logfile(){
	if [ ! -z $1 ];then
		LOG_FILE=$1
	fi
	if [ ! -e $LOG_FILE ];then
		cp /dev/null $LOG_FILE
	fi
	pwd
	local rotate_size=100000 #line
	local logfile_line_num=`wc -l < $LOG_FILE`
	if [ $logfile_line_num -ge $rotate_size ];then
		local last_logfile=`ls $LOG_FILE* | xargs -i basename {} | tail -n 1`
		local IFS_ORIGINAL="$IFS"
		local IFS=.
		local arr=($last_logfile)
		local num=`expr ${arr[1]} + 1`
		cp $LOG_FILE $LOG_FILE.$num
		cp /dev/null $LOG_FILE
		local IFS="$IFS_ORIGINAL"
	fi
}

function log_debug() {
	if [ $LOG_LEVEL == 'DEBUG' ];then
		if [ -n $2 ];then
			LOG_FILE=$2
		fi
		rotate_logfile $LOG_FILE
		echo "--------"`date +%Y%m%d%H%M%S` $0 "--------" >> $LOG_FILE;echo -e "[DEBUG] $1" >> $LOG_FILE
	fi
}

function log_info() {
	if [ $LOG_LEVEL == "DEBUG" -o $LOG_LEVEL == "INFO" ];then
		if [ -n $2 ];then
			LOG_FILE=$2
		fi
		rotate_logfile $LOG_FILE
		echo "--------"`date +%Y%m%d%H%M%S` $0 "--------" >> $LOG_FILE;echo -e "[INFO] $1" >> $LOG_FILE
	fi
}

function log_warning(){
	if [ $LOG_LEVEL == "DEBUG" -o $LOG_LEVEL == "INFO" -o $LOG_LEVEL == "WARN" ];then
		if [ -n $2 ];then
			LOG_FILE=$2
		fi
		rotate_logfile $LOG_FILE
		echo "--------"`date +%Y%m%d%H%M%S` $0"--------" >> $LOG_FILE
		echo "[[WARNING]] $1" >> $LOG_FILE
		echo "[[WARNING]] $1"
	fi
}

function log_fatal(){
	if [ $LOG_LEVEL == "DEBUG" -o $LOG_LEVEL == "INFO" -o $LOG_LEVEL == "WARN" -o $LOG_LEVEL == "FATAL" ];then
		if [ -n $2 ];then
			LOG_FILE=$2
		fi
		rotate_logfile $LOG_FILE
		echo "--FATAL-- "`date +%Y%m%d%H%M%S` $0"--------" >> $LOG_FILE
		echo "[[[FATAL]]]] $1" >> $LOG_FILE
		echo "[[[FATAL]]] $1"
		exit 1
	fi
}
