#! /bin/bash

PASS=root
echo ${PASS}
echo root:${PASS} | chpasswd

vncdir=/root/.vnc
vncpassfile=${vncdir}/passwd
mkdir ${vncdir}
chmod 700 ${vncdir}
echo ${PASS} | vncpasswd -f > ${vncpassfile}
chmod 600 ${vncpassfile}

vncserver -geometry 1280x720 -depth 8 :0
/usr/sbin/sshd -D

