# Start with an image with builtin cuda/cudnn officially provided by Nvidia.
FROM nvidia/cuda:7.5-cudnn5-devel

# Install torch.
RUN apt-get -y update && apt-get -y install git
RUN git clone https://github.com/torch/distro.git ~/torch --recursive && \
	cd ~/torch && \
	bash install-deps && \
	./install.sh

# Install fblualib.
# The download link of 'gtest' was broken in the original thpp install sccript,
# so we use a modified version where the link has been tempolarily fixed.
RUN cd ~/ && \
	git clone https://github.com/dgyoo/fblualib.git && \
	cd fblualib && \
	./install_all.sh 

# Install utils.
RUN apt-get -y update && \
	apt-get -y install vim && \
	apt-get -y install git && \
	apt-get -y install wget

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
	useradd -u $USER_ID -g $USER_NAME -m -s /bin/bash $USER_NAME && \
	chmod -R 555 /root/ # Torch7 is installed here so we must give the authority for read to users.

# Set my taste.
RUN echo "\n#Added by me.\ncd ~/\nalias v='vim'" >> /home/$USER_NAME/.bashrc && \
	echo "syntax on\nfiletype indent plugin on\nset autoindent\nset nu\nset hlsearch\nset tabstop=3" >> /home/$USER_NAME/.vimrc
