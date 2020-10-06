FROM conda/miniconda3-centos7

LABEL gitUrl="ssh://git@gitlab.curie.fr:2222/data-analysis/nf-vegan.git"
LABEL gitCommit="fdcf1052daa901571e4dffca9f314251ad5424f0 / devel"

RUN yum install -y which   \
&& yum clean all \
&& conda create -y -n bwa_env  \
&& conda install -y -c bioconda -n bwa_env bwa=0.7.17 \
&& echo "source activate bwa_env" > ~/.bashrc \
&& conda clean -a


ENV PATH /usr/local/envs/bwa_env/bin:$PATH

ENV LC_ALL en_US.utf-8
ENV LANG en_US.utf-8
