FROM conda/miniconda3-centos7

LABEL gitUrl="ssh://git@gitlab.curie.fr:2222/data-analysis/nf-vegan.git"
LABEL gitCommit="fdcf1052daa901571e4dffca9f314251ad5424f0 / devel"

RUN yum install -y which   \
&& yum clean all \
&& conda create -y -n python_env  \
&& conda install -y -c conda-forge -n python_env python=3.8.5 \
&& echo "source activate python_env" > ~/.bashrc \
&& conda clean -a


ENV PATH /usr/local/envs/python_env/bin:$PATH

ENV LC_ALL en_US.utf-8
ENV LANG en_US.utf-8
