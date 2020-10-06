FROM conda/miniconda3-centos7

LABEL gitUrl="ssh://git@gitlab.curie.fr:2222/data-analysis/nf-vegan.git"
LABEL gitCommit="fdcf1052daa901571e4dffca9f314251ad5424f0 / devel"

RUN yum install -y which   \
&& yum clean all \
&& conda create -y -n sambamba_env  \
&& conda install -y -c defaults -n sambamba_env conda=4.8.2 \
&& conda install -y -c conda-forge -n sambamba_env libdeflate=1.6 \
&& conda install -y -c conda-forge -n sambamba_env ldc=1.20.0 \
&& conda install -y -c bioconda -n sambamba_env htslib=1.10.2 \
&& conda install -y -c bioconda -n sambamba_env sambamba=0.7.1 \
&& echo "source activate sambamba_env" > ~/.bashrc \
&& conda clean -a


ENV PATH /usr/local/envs/sambamba_env/bin:$PATH

ENV LC_ALL en_US.utf-8
ENV LANG en_US.utf-8
