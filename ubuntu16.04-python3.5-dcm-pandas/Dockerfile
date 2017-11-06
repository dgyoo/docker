FROM ubuntu:16.04 

# Do the job.
RUN apt-get update
RUN apt-get install -y git vim
RUN apt-get install -y python3 python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install "ipython[all]" && \
    pip3 install ipdb
RUN pip3 install pandas openpyxl pydicom
RUN pip3 install opencv-python && \
    apt-get update && \
    apt-get install -y libgtk2.0-dev

# Set account.
ENV USER_NAME=dgyoo
ENV USER_ID=1014
RUN useradd -u $USER_ID -s /bin/bash -m $USER_NAME

# Personal setup.
RUN apt-get update && apt-get -y install vim
RUN echo "\n# mysetup.\ncd ~/\nalias v='vim'\nalias python='python3'" >> /home/$USER_NAME/.bashrc && \
	echo "set nu\nset hlsearch\nfiletype plugin indent on\n\" show existing tab with 4 spaces width\nset tabstop=4\n\" when indenting with >, use 4 spaces width\nset shiftwidth=4\n\" on pressing tab, insert 4 spaces\nset expandtab" >> /home/$USER_NAME/.vimrc
