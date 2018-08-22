#!/bin/bash
#
# Permet de tester rapidement la fonction mail de php sur le serveur à containers
#
read -p "Adresse mail (par défaut aci@acti.fr) : " recipient
if [ "$recipient" == "" ]; then recipient="aci@acti.fr"; fi
mv current/web/.htaccess current/web/htaccess
cat <<EOF > current/web/syscheck.php
<?php
echo mail("$recipient", "Test objet", "Test Message");
EOF
chmod +x current/web/syscheck.php
domain=$(grep -i -m1 serveralias config/apache_vhost.conf | awk '{print $2}')
wget -qO- --header="Host: $domain" http://127.0.0.1/syscheck.php
echo ""
mv current/web/htaccess current/web/.htaccess
rm current/web/syscheck.php