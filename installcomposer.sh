#!/bin/bash
#
# Installe composer sur le serveur à containers
#
wget https://getcomposer.org/installer
ssh php /usr/bin/php installer
rm installer