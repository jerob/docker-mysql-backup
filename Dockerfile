#
#                    ##        .            
#              ## ## ##       ==            
#           ## ## ## ##      ===            
#       /""""""""""""""""\___/ ===        
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
#       \______ o          __/            
#         \    \        __/             
#          \____\______/                
# 
#          |          |
#       __ |  __   __ | _  __   _
#      /  \| /  \ /   |/  / _\ | 
#      \__/| \__/ \__ |\_ \__  |
#
# Dockerfile for backup MariaDB/Mysql database
#

FROM debian:stretch-slim

MAINTAINER Jeremie Robert appydo@gmail.com version: 0.3

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
&& apt-get -y upgrade \
&& apt-get -y install mysql-client

ADD ./backup.sh /backup.sh

CMD ["/bin/bash", "/backup.sh"]
