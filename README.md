# Sys online tools
## Specific for Acti environments


#### Php Mail tester for Eolas container host
```sh
curl -skL https://raw.githubusercontent.com/c2is/sysot/master/mailtest.sh --output mailtest.sh; chmod +x mailtest.sh; ./mailtest.sh; rm mailtest.sh;
```

#### Install composer
```sh
curl -skL https://raw.githubusercontent.com/c2is/sysot/master/installcomposer.sh --output installcomposer.sh; chmod +x installcomposer.sh; ./installcomposer.sh; rm installcomposer.sh;
```

#### Install srdb (Search and Replace Dababase)
```sh
curl -skL https://raw.githubusercontent.com/c2is/sysot/master/installsrdb.sh --output installsrdb.sh; chmod +x installsrdb.sh; ./installsrdb.sh; rm installsrdb.sh;
```
#### Srdb example of use in dry mode (-z)  
ssh php /usr/bin/php srdb/srdb.cli.php -z -h 10.128.19.162 -u $(grep "DB_USER" ../current/web/wp-config.php| cut -d "'" -f 4) -p$(grep "DB_PASSWORD" ../current/web/wp-config.php| cut -d "'" -f 4) -n $(grep "DB_NAME" ../current/web/wp-config.php| cut -d "'" -f 4) -s "http://pattern/to/replace/" -r "http://pattern/in/replacementÒ/"