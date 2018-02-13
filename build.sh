#!/bin/bash -ex


TMP_DIR=/tmp/book
OUTPUT_DIR=$TMP_DIR/_book
WEB_DIR=/var/www/html/notes

default(){
  #gitbook build ./ -f site --output=$OUTPUT_DIR/
  gitbook build ./ -f site --output=$OUTPUT_DIR/
  sudo scp -r $OUTPUT_DIR/* $WEB_DIR/
  sudo /etc/init.d/nginx restart
}


create_dir(){
  if [ ! -d $1 ];then
     mkdir -p $1
  fi
  sudo rm -rf $1/**
}

build(){
  create_dir $TMP_DIR
  cp -r ./* $TMP_DIR/
  pushd $TMP_DIR/
  mv $TMP_DIR/summaries/$1/* $TMP_DIR/
  gitbook build $TMP_DIR/ -f site --output=$OUTPUT_DIR/

  create_dir $WEB_DIR/$1
  sudo scp -r $OUTPUT_DIR/* $WEB_DIR/$1/
  sudo /etc/init.d/nginx restart
  popd
  sudo rm -rf $TMP_DIR
}


# if [ ! -d ./summaries/$1 ]; then
#   echo $(ls ./summaries/)
#   exit 1
# fi

#build basic101
build android
build devops
