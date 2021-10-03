FROM ubuntu:latest

RUN apt-get update && apt-get install -y openssh-server

RUN mkdir /var/run/sshd && echo 'root:demo' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

RUN sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

CMD /usr/sbin/sshd -D

EXPOSE 2222