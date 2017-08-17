#!/bin/bash -ex 

OUTPUT_DIR=./_book
WEB_DIR=/var/www/html/notes

gitbook build ./ -f site --output=$OUTPUT_DIR/
sudo scp -r $OUTPUT_DIR/* $WEB_DIR/
sudo /etc/init.d/nginx restart
