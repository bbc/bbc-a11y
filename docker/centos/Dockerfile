FROM centos:7.3.1611

RUN yum -y install epel-release

RUN yum -y install clang dbus-devel gtk2-devel libnotify-devel\
 libgnome-keyring-devel xorg-x11-server-utils libcap-devel\
 cups-devel libXtst-devel alsa-lib-devel libXrandr-devel\
 GConf2-devel nss-devel\
 xorg-x11-server-Xvfb which gcc-c++ tar make wget nodejs git

RUN git clone https://github.com/electron/electron.git
RUN cd electron && ./script/bootstrap.py -v -y

RUN git clone https://github.com/bbc/bbc-a11y.git
RUN cd bbc-a11y && npm i

RUN wget http://ftp.gnu.org/gnu/binutils/binutils-2.28.tar.gz
RUN tar -xzf binutils-2.28.tar.gz
RUN cd binutils-2.28 && ./configure --with-sysroot && make && make install

RUN cd electron && ./script/build.py

RUN yum -y install libXScrnSaver bzip2

RUN rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/ORBit2-2.14.17-6.el6_8.x86_64.rpm
RUN rpm -ivh http://mirror.centos.org/centos/6/os/x86_64/Packages/ORBit2-devel-2.14.17-6.el6_8.x86_64.rpm

RUN wget ftp://ftp.gnome.org/pub/GNOME/sources/GConf/2.32/GConf-2.32.4.tar.bz2
RUN tar -jxvf GConf-2.32.4.tar.bz2
RUN cd GConf-2.32.4 && ./configure && make && make install
