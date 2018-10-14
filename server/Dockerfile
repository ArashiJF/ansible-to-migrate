FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y ufw

RUN ufw default allow incoming
RUN ufw default allow outgoing
#RUN sudo ufw allow 22

RUN apt-get install -y openssh-server python
RUN mkdir /var/run/sshd

COPY authorized_keys /root/.ssh/authorized_keys

RUN ["chmod","0600","/root/.ssh/authorized_keys"]

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
