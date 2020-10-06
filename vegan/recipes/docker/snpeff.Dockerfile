FROM conda/miniconda3-centos7

LABEL gitUrl="ssh://git@gitlab.curie.fr:2222/data-analysis/nf-vegan.git"
LABEL gitCommit="fdcf1052daa901571e4dffca9f314251ad5424f0 / devel"

RUN yum install -y which   \
&& yum clean all \
&& conda create -y -n snpeff_env  \
&& conda install -y -c bioconda -n snpeff_env snpeff=4.3.1t \
&& echo "source activate snpeff_env" > ~/.bashrc \
&& conda clean -a


ENV PATH /usr/local/envs/snpeff_env/bin:$PATH

ENV LC_ALL en_US.utf-8
ENV LANG en_US.utf-8
