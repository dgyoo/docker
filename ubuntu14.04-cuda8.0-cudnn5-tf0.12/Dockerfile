# Start with an utuntu 14.04 image 
# with builtin cuda/cudnn officially provided by Nvidia.
FROM gcr.io/tensorflow/tensorflow:0.12.1-gpu

# Set account. This script 
# 1) creates a user account in this docker image and
# 2) authorizes the host user to read/write files created by this image user,
#    and also authorize this image user to read/write files created by the host user,
#    by make them share the same user/group id and name.
ENV USER_NAME=dgyoo
ENV USER_ID=2029
RUN useradd -u $USER_ID -s /bin/bash -m $USER_NAME

# Install python packages.
RUN pip --no-cache-dir install scikit-image

# Install utils.
RUN apt-get -y update && \
	apt-get -y install vim git wget

# Personal setup.
RUN echo "\n# mysetup.\ncd ~/\nalias v='vim'" >> /home/$USER_NAME/.bashrc && \
	echo "set nu\nset hlsearch\nfiletype plugin indent on\n\" show existing tab with 4 spaces width\nset tabstop=4\n\" when indenting with >, use 4 spaces width\nset shiftwidth=4\n\" on pressing tab, insert 4 spaces\nset expandtab" >> /home/$USER_NAME/.vimrc
