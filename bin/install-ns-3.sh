
#!/bin/bash
export LANG=C
cd `dirname $0`

VERSION=3.25
install_dir=/usr/local/src

source ../lib/util/utils.sh
function log_info_() { echo $1; log_info "$1" "$(cd $(dirname $0) && pwd)/../var/log/install-ns-3.log";}


log_info_ "install-ns-3.sh start at `date`"

## package check
#echo "---- package check"
#PACKAGES=(gcc g++ python python-dev qt4-dev-tools libqt4-dev mercurial bzr cmake libc6-dev libc6-dev-i386 g++-multilib gdb valgrind gsl-bin libgsl0-dev libgsl0ldbl flex bison libfl-dev tcpdump sqlite sqlite3 libsqlite3-dev libxml2 libxml2-dev libgtk2.0-0 libgtk2.0-dev vtun lxc uncrustify doxygen graphviz imagemagick texlive texlive-extra-utils texlive-latex-extra texlive-font-utils texlive-lang-portuguese dvipng)
#for package in ${PACKAGES[@]}; do
#	dpkg -l $package > /dev/null 2>&1
#	if [ $? -ne 0 ];then
#		log_info_ "apt-get install -y $package."
#		sudo apt-get install -y $package
#		if [ $? -ne 0 ];then
#			log_info_ "error at installing $package"
#			log_info_ "error at installing $package"
#			exit
#		fi
#	fi
#done


#log_info_ "---- download and decompress."
#tar_dir=../usr/local/src
#tar_file=ns-allinone-$VERSION.tar.bz2
#if [ ! -e "$install_dir/ns-allinone-$VERSION.tar.bz2" ];then
#	log_info_ "wget https://www.nsnam.org/release/ns-allinone-$VERSION.#tar.bz2 -o $tar_dir/$tar_file"
#	wget "https://www.nsnam.org/release/ns-allinone-$VERSION.tar.bz2" -o "$tar_dir/$tar_file"
#	sudo cp $tar_dir/$tar_file $install_dir/$tar_file
#fi

log_info_ "tar jxvf $install_dir/$tar_file -C $install_dir/ 1> /dev/null"
cd $install_dir
sudo tar jxvf $install_dir/$tar_file -C $install_dir/ 1> /dev/null


log_info_ "install-ns-3.sh finished at `date`"
