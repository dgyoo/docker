# Install pytorch from ubuntu 16.04 with cuda8.0 and cudnn 6.
# Codes copied from https://github.com/pytorch/pytorch/blob/master/Dockerfile
# with a slight modification in that repository cloning (line 27-29) added.
FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04 
RUN echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    curl \
    vim \
    ca-certificates \
    libjpeg-dev \
    libpng-dev &&\
    rm -rf /var/lib/apt/lists/*
RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-4.2.12-Linux-x86_64.sh  && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /opt/conda && \     
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda install conda-build && \
    /opt/conda/bin/conda create -y --name pytorch-py35 python=3.5.2 numpy pyyaml scipy ipython mkl&& \
    /opt/conda/bin/conda clean -ya 
ENV PATH /opt/conda/envs/pytorch-py35/bin:$PATH
RUN conda install --name pytorch-py35 -c soumith magma-cuda80
WORKDIR /opt/pytorch
COPY . .
RUN TORCH_CUDA_ARCH_LIST="3.5 5.2 6.0 6.1+PTX" TORCH_NVCC_FLAGS="-Xfatbin -compress-all" \
    CMAKE_PREFIX_PATH="$(dirname $(which conda))/../" \ 
    git clone --recursive https://github.com/pytorch/pytorch.git && cd pytorch && pip install -v .
RUN git clone https://github.com/pytorch/vision.git && cd vision && pip install -v .
WORKDIR /workspace
RUN chmod -R a+w /workspace

# Install scikit-image.
RUN pip install scikit-image

# Set account.
ENV USER_NAME=dgyoo
ENV USER_ID=1000
RUN useradd -u $USER_ID -s /bin/bash -m $USER_NAME

# Personal setup.
RUN apt-get update && apt-get -y install vim
RUN echo "\n# mysetup.\ncd ~/\nalias v='vim'" >> /home/$USER_NAME/.bashrc && \
	echo "set nu\nset hlsearch\nfiletype plugin indent on\n\" show existing tab with 4 spaces width\nset tabstop=4\n\" when indenting with >, use 4 spaces width\nset shiftwidth=4\n\" on pressing tab, insert 4 spaces\nset expandtab" >> /home/$USER_NAME/.vimrc
