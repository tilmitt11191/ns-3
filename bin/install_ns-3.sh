
#!/bin/bash
export LANG=C

source ../lib/util/utils.sh
function log_info_() { log_debug "$1" "../var/log/ninstall_ns-3.log";}


echo 'install_ns-3.sh start'
log_info_ 'install_ns-3.sh start'


https://www.nsnam.org/release/ns-allinone-3.25.tar.bz2

## package check
#echo "package check"
#PACKAGES=(git wget nkf ruby ruby-dev libxml2 libxml2-dev libxslt-dev zlib1g-dev)
#for package in ${PACKAGES[@]}; do
#	dpkg -l $package > /dev/null 2>&1
#	if [ $? -ne 0 ];then
#		echo "apt-get install -y $package."
#		sudo apt-get install -y $package
#	fi
#done

date