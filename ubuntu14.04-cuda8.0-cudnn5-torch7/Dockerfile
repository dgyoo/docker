# Start with an utuntu 14.04 image 
# with builtin cuda/cudnn officially provided by Nvidia.
FROM nvidia/cuda:8.0-cudnn5-devel

# Set account. This script 
# 1) creates a user account in this docker image and
# 2) authorizes the host user to read/write files created by this image user,
#    and also authorize this image user to read/write files created by the host user,
#    by make them share the same user/group id and name.
ENV USER_NAME=dgyoo
ENV USER_ID=1000
ENV GROUP_NAME=dgyoo
ENV GROUP_ID=1000
RUN groupadd -r $GROUP_NAME -g $GROUP_ID && \
	useradd -u $USER_ID -g $USER_NAME -m -s /bin/bash $USER_NAME

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
	luarocks install loadcaffe

# Install utils.
RUN apt-get -y update && \
	apt-get -y install vim git wget

# Set my taste.
RUN echo "\n#Added by me.\ncd ~/\nalias v='vim'\n. ~/torch/install/bin/torch-activate" >> /home/$USER_NAME/.bashrc && \
	echo "syntax on\nfiletype indent plugin on\nset autoindent\nset nu\nset hlsearch\nset tabstop=3" >> /home/$USER_NAME/.vimrc
