#!/bin/bash

# Set docker.
DOCKER_USER_NAME="dgyoo"
DOCKER_IMAGE_NAME=("dgyoo/ubuntu14.04-cuda8.0-cudnn5-torch7:latest" "dgyoo/ubuntu14.04-cuda8.0-cudnn5-tf:latest")
DOCKER_IMAGE_ALIAS=("torchos" "tfos")
echo -e "\n# myalias." >> ~/.bashrc
for i in ${!DOCKER_IMAGE_NAME[*]}
do
    echo -e "alias ${DOCKER_IMAGE_ALIAS[$i]}='nvidia-docker run --rm -it -u $DOCKER_USER_NAME \ " >> ~/.bashrc
    echo -e "    -v ~/workspace/:/home/$DOCKER_USER_NAME/workspace \ " >> ~/.bashrc
    echo -e "    ${DOCKER_IMAGE_NAME[$i]}'" >> ~/.bashrc
    echo -e "alias ${DOCKER_IMAGE_ALIAS[$i]}-root='nvidia-docker run -it \ " >> ~/.bashrc
    echo -e "    ${DOCKER_IMAGE_NAME[$i]}'" >> ~/.bashrc
done

# Set vim.
echo -e "alias v='vim'" >> ~/.bashrc
if [ -f ~/.vimrc ]; then
    rm ~/.vimrc
fi
echo -e "set nu" >> ~/.vimrc
echo -e "set hlsearch" >> ~/.vimrc
echo -e "filetype plugin indent on" >> ~/.vimrc
echo -e "\" show existing tab with 4 spaces width" >> ~/.vimrc
echo -e "set tabstop=4" >> ~/.vimrc
echo -e "\" when indenting with >, use 4 spaces width" >> ~/.vimrc
echo -e "set shiftwidth=4" >> ~/.vimrc
echo -e "\" on pressing tab, insert 4 spaces" >> ~/.vimrc
echo -e "set expandtab" >> ~/.vimrc

# Apply.
source ~/.bashrc
