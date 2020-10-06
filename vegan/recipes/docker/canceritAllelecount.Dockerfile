FROM conda/miniconda3-centos7

LABEL gitUrl="ssh://git@gitlab.curie.fr:2222/data-analysis/nf-vegan.git"
LABEL gitCommit="fdcf1052daa901571e4dffca9f314251ad5424f0 / devel"

RUN yum install -y which   \
&& yum clean all \
&& conda create -y -n canceritAllelecount_env  \
&& conda install -y -c bioconda -n canceritAllelecount_env cancerit-allelecount=4.0.2 \
&& echo "source activate canceritAllelecount_env" > ~/.bashrc \
&& conda clean -a


ENV PATH /usr/local/envs/canceritAllelecount_env/bin:$PATH

ENV LC_ALL en_US.utf-8
ENV LANG en_US.utf-8
