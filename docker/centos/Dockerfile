FROM centos:7.3.1611

RUN yum -y install xorg-x11-server-Xvfb

RUN yum -y install epel-release
RUN yum -y install nodejs
RUN yum -y install git

RUN yum -y install clang dbus-devel gtk2-devel libnotify-devel\
 libgnome-keyring-devel xorg-x11-server-utils libcap-devel\
 cups-devel libXtst-devel alsa-lib-devel libXrandr-devel\
 GConf2-devel nss-devel

RUN git clone https://github.com/electron/electron.git

RUN yum -y install which gcc-c++ tar
RUN cd electron && ./script/bootstrap.py -v -y

RUN git clone https://github.com/bbc/bbc-a11y.git
RUN cd bbc-a11y && npm i

RUN cd electron && ./script/build.py
