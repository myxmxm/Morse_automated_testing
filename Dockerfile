FROM gogs/gogs

RUN  /bin/sed -i 's/Port 22/Port 10022/' /app/gogs/docker/sshd_config
RUN  /bin/echo "PubkeyAcceptedAlgorithms +ssh-rsa" >> /app/gogs/docker/sshd_config