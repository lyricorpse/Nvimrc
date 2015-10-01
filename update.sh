#!/bin/bash

echo "Updating .vim ..."
cp -r ~/.nvim/* .

echo "Updating .vimrc ..."
cp ~/.nvimrc ./nvimrc

exit 0
