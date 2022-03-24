FROM centos:7

RUN yum -y update
RUN yum -y install httpd
RUN yum -y install stunnel

CMD ["/bin/bash", "-c", "tail -f /dev/null"]
