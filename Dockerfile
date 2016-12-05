FROM armv7/armhf-ubuntu:16.04
RUN apt-get update && apt-get install -y openssh-server openconnect hping3
RUN mkdir /var/run/sshd
EXPOSE 22
RUN useradd -m tunnel -d /home/tunnel && mkdir /home/tunnel/.ssh
RUN chsh -s /bin/false tunnel
RUN printf "\nMatch User tunnel\n   AllowTcpForwarding yes\n   X11Forwarding no\n   PasswordAuthentication no\n" >> /etc/ssh/sshd_config
RUN touch /home/tunnel/.ssh/authorized_keys
RUN chown tunnel:tunnel -R /home/tunnel/.ssh && chmod 700 /home/tunnel/.ssh && chmod 600 /home/tunnel/.ssh/*
COPY script.sh /root/script.sh
RUN chmod +x /root/script.sh
CMD /root/script.sh
