FROM centos/systemd

RUN echo root:root | chpasswd
RUN yum install -y openssh-server; systemctl enable sshd.service; \
    yum install -y python3; \
    yum install -y sysstat; \
    yum install -y net-tools; \
    yum clean all;

EXPOSE 22

CMD ["/usr/sbin/init"]
