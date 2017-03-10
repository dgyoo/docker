# Start with an utuntu 14.04 image 
# with builtin cuda/cudnn officially provided by Nvidia.
FROM nvidia/cuda:7.5-cudnn5-devel-ubuntu14.04

# Set account. This script 
# 1) creates a user account in this docker image and
# 2) authorizes the host user to read/write files created by this image user,
#    and also authorize this image user to read/write files created by the host user,
#    by make them share the same user/group id and name.
ENV USER_NAME=dgyoo
ENV USER_ID=1000
RUN useradd -u $USER_ID -s /bin/bash -m $USER_NAME

# Install torch.
# This will be located in user home.
RUN apt-get -y update && apt-get -y install git
RUN git clone https://github.com/torch/distro.git /home/$USER_NAME/torch --recursive && \
	cd /home/$USER_NAME/torch && \
	bash install-deps && \
	./install.sh

# Install fblualib.
# This will be located in user home.
# The download link of 'gtest' was broken in the original thpp install sccript,
# so we use a modified version where the link has been tempolarily fixed.
RUN git clone https://github.com/dgyoo/fblualib.git /home/$USER_NAME/fblualib && \
	cd /home/$USER_NAME/fblualib && \
	. /home/$USER_NAME/torch/install/bin/torch-activate && \
	./install_all.sh 

# Install loadcaffe.
RUN apt-get -y install libprotobuf-dev protobuf-compiler && \
	. /home/$USER_NAME/torch/install/bin/torch-activate && \
	luarocks install loadcaffe

# Install utils.
RUN apt-get -y update && \
	apt-get -y install vim git wget

# Set my taste.
RUN echo "\n#Added by me.\ncd ~/\nalias v='vim'\n. ~/torch/install/bin/torch-activate" >> /home/$USER_NAME/.bashrc && \
	echo "set nu\nset hlsearch\nfiletype plugin indent on\n\" show existing tab with 4 spaces width\nset tabstop=4\n\" when indenting with >, use 4 spaces width\nset shiftwidth=4\n\" on pressing tab, insert 4 spaces\nset expandtab" >> /home/$USER_NAME/.vimrc
