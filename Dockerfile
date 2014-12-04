FROM centos:latest

RUN yum -y install https://s3.amazonaws.com/cfengine.package-repos/community_binaries/cfengine-community-3.5.0-1.x86_64.rpm && yum -y clean all

CMD cf-agent -B `ip add show eth0 | sed -nr 's#.*inet (([0-9]+\.){3}[0-9]+)/.*#\1#p'` && tail -f /var/cfengine/promise_summary.log
