FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y openssh-server sudo

RUN mkdir /var/run/sshd
RUN echo 'root:uurx9qunr9-4qurfhq9-39;;hhhha23[874]' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config

# create ssh test user
RUN useradd -m my_test_ssh_user -s /bin/bash && \
    echo 'my_test_ssh_user:testpass' | chpasswd && \
    adduser my_test_ssh_user sudo

# create ssh key directory for ssh test user
RUN mkdir /home/my_test_ssh_user/.ssh && \
    chmod 700 /home/my_test_ssh_user/.ssh && \
    chown my_test_ssh_user:my_test_ssh_user /home/my_test_ssh_user/.ssh

EXPOSE 22

# run SSH server
CMD ["/usr/sbin/sshd", "-D"]
