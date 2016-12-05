#!/bin/bash
ip route add 192.168.1.0/24 via 172.17.0.1 dev eth0 
ip route show
/usr/sbin/sshd -D &
echo $KEY > /home/tunnel/.ssh/authorized_keys
RUN chown tunnel:tunnel -R /home/tunnel/.ssh && chmod 700 /home/tunnel/.ssh && chmod 600 /home/tunnel/.ssh/*
bash -c "hping3 172.20.4.1 &" 
bash -c "echo $PASS | openconnect -u $USER --passwd-on-stdin $URL"
