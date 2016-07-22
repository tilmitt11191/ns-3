
#!/bin/bash
source ../lib/util/utils.sh

export LANG=C
cd `dirname $0`

VERSION=3.25
current_dir=`pwd`
user=`whoami`
install_dir=/usr/local/src
tar_file=ns-allinone-$VERSION.tar.bz2
LOG_FILE="$(cd $(dirname $0) && pwd)/../var/log/install-ns-3.log"

function log_info_() { echo $1; log_info "$1" "$LOG_FILE" ;}


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

cd $install_dir
log_info_ "pwd[`pwd`]"

log_info_ "---- download and decompress."
#if [ ! -e "$install_dir/ns-allinone-$VERSION.tar.bz2" ];then
#	log_info_ "sudo wget https://www.nsnam.org/release/ns-allinone-$VERSION.tar.bz2"
#	sudo wget "https://www.nsnam.org/release/ns-allinone-$VERSION.tar.bz2"
#else
#	log_info_ "$install_dir/ns-allinone-$VERSION.tar.bz2 already exists."
#fi

log_info_ "sudo tar xvf $tar_file"
#sudo tar xvf $tar_file

sudo chown -R $user ./ns-allinone-$VERSION
sudo chmod -R 774 ./ns-allinone-$VERSION

log_info_ "---- build."
log_info_ "cd ./ns-allinone-$VERSION"
cd ./ns-allinone-$VERSION
log_info_ "./build.py --enable-examples --enable-tests"
./build.py --enable-examples --enable-tests

log_info_ "---- test."
cd ns-$VERSION
./test.py

log_info_ "install-ns-3.sh finished at `date`"
