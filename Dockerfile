FROM lukaf/centos7:latest

RUN yum -y install iproute https://s3.amazonaws.com/cfengine.package-repos/community_binaries/cfengine-community-3.5.0-1.x86_64.rpm && yum -y clean all

EXPOSE 5308

CMD cf-agent -B `grep -f /proc/sys/kernel/hostname /etc/hosts | awk '{print $1}'` && tail -f /var/cfengine/promise_summary.log
