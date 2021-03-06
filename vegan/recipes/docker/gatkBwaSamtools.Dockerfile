FROM conda/miniconda3-centos7

LABEL gitUrl="ssh://git@gitlab.curie.fr:2222/data-analysis/nf-vegan.git"
LABEL gitCommit="fdcf1052daa901571e4dffca9f314251ad5424f0 / devel"

RUN yum install -y which   \
&& yum clean all \
&& conda create -y -n gatkBwaSamtools_env  \
&& conda install -y -c bioconda -n gatkBwaSamtools_env gatk4=4.1.4.1 \
&& conda install -y -c bioconda -n gatkBwaSamtools_env bwa=0.7.17 \
&& conda install -y -c bioconda -n gatkBwaSamtools_env samtools=1.9 \
&& echo "source activate gatkBwaSamtools_env" > ~/.bashrc \
&& conda clean -a


ENV PATH /usr/local/envs/gatkBwaSamtools_env/bin:$PATH

ENV LC_ALL en_US.utf-8
ENV LANG en_US.utf-8
