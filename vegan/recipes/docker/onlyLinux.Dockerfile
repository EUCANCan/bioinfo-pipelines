FROM centos:7

LABEL gitUrl="ssh://git@gitlab.curie.fr:2222/data-analysis/nf-vegan.git"
LABEL gitCommit="fdcf1052daa901571e4dffca9f314251ad5424f0 / devel"

RUN yum install -y which \
&& yum clean all

ENV LC_ALL en_US.utf-8
ENV LANG en_US.utf-8
