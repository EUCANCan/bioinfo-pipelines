FROM conda/miniconda3-centos7

LABEL gitUrl="ssh://git@gitlab.curie.fr:2222/data-analysis/nf-vegan.git"
LABEL gitCommit="fdcf1052daa901571e4dffca9f314251ad5424f0 / devel"

RUN yum install -y which   \
&& yum clean all \
&& conda create -y -n multiqc_env  \
&& conda install -y -c defaults -n multiqc_env conda=4.6.14 \
&& conda install -y -c conda-forge -n multiqc_env lzstring=1.0.4 \
&& conda install -y -c conda-forge -n multiqc_env matplotlib-base=3.1.1 \
&& conda install -y -c conda-forge -n multiqc_env spectra=0.0.11 \
&& conda install -y -c bioconda -n multiqc_env multiqc=1.8 \
&& echo "source activate multiqc_env" > ~/.bashrc \
&& conda clean -a


ENV PATH /usr/local/envs/multiqc_env/bin:$PATH

ENV LC_ALL en_US.utf-8
ENV LANG en_US.utf-8
