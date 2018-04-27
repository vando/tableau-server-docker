FROM centos/systemd
MAINTAINER @vando

# this is the version what we're building
ENV TABLEAU_VERSION="10.5.2" \
    LANG=en_US.UTF-8

# make systemd dbus visible 
VOLUME /sys/fs/cgroup /run /tmp

# Install core bits and their deps:w
RUN sed -i '/^enabled/s/1/0/' /etc/yum/pluginconf.d/fastestmirror.conf
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y iproute curl sudo vim
RUN adduser tsm && \
    (echo tsm:tsm | chpasswd) && \
    (echo 'tsm ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/tsm) && \
    mkdir -p /run/systemd/system /opt/tableau/docker_build

COPY config/* /opt/tableau/docker_build/

RUN mkdir -p /etc/systemd/system/ && \
    cp /opt/tableau/docker_build/tableau-server-install.service /etc/systemd/system/ && \
    systemctl enable tableau-server-install
RUN chmod +x /opt/tableau/docker_build/tableau.install

# Expose TSM and Gateway ports
EXPOSE 80 8850

CMD /sbin/init
