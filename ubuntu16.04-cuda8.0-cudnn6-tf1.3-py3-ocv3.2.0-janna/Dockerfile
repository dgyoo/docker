FROM lunit/base_mg:ubuntu16.04-py3-cuda8.0-cudnn6-tf1.3-ocv3.2.0
MAINTAINER Donggeun Yoo <dgyoo@lunit.io>

RUN apt-get update -y && apt-get install -y --no-install-recommends \
        python3-tk \
        imagemagick \
        graphviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/jhlee525/janna.git /janna && \
    cd janna && \
    pip install . && \
    cd .. && \
    rm -rf /janna


# Set account.
ENV USER_NAME=dgyoo
ENV USER_ID=1000
RUN useradd -u $USER_ID -s /bin/bash -m $USER_NAME

# Personal setup.
RUN echo "\n# mysetup.\ncd ~/\nalias v='vim'" >> /home/$USER_NAME/.bashrc && \
	echo "set nu\nset hlsearch\nfiletype plugin indent on\n\" show existing tab with 4 spaces width\nset tabstop=4\n\" when indenting with >, use 4 spaces width\nset shiftwidth=4\n\" on pressing tab, insert 4 spaces\nset expandtab" >> /home/$USER_NAME/.vimrc
