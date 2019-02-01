#!/bin/bash
#
# Permet de tester rapidement du code php en mode web
#

read -p 'Le code sera à inclure dans un shell_exec("") ? [Y,n]' type
read -p "Code : " code

case $type in 
    Y|y)
	 code="shell_exec(\"$code\");"
    ;;
    N|n)
    ;;
    *)
		echo "Option $type inexistante"
		exit 1
    ;;
esac

mv current/web/.htaccess current/web/htaccess
cat <<EOF > current/web/sys.php
<?php
$code
EOF
chmod +x current/web/sys.php
domain=$(grep -i -m1 serveralias config/apache_vhost.conf | awk '{print $2}')
wget -qO- --header="Host: $domain" http://127.0.0.1/sys.php
echo ""
mv current/web/htaccess current/web/.htaccess
rm current/web/sys.php