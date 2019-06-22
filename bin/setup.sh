#/bin/sh

# Date: 2016-05-05
# Version: 1.0.0
# License: MIT
# author: Mohamed Benrebia <mohamed@ipfinder.io>

## TOLLS
# grep
# head
# read
# stty
# echo
# exit
# find
# exec
# sed
# cp
# ls
# mkdir
##

####################COLOR##############
clear
Color_Off='\033[0m'

Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
#######################################


###############################BANNER##################################
echo -e "
$Cyan
                +-++-++-++-++-++-++-++-+ +-++-++-++-++-+ +-++-++-++-+
                |I||P||F||i||n||d||e||r| |P||r||o||x||y| |p||a||s||s|
                +-++-++-++-++-++-++-++-+ +-++-++-++-++-+ +-++-++-++-+
                      Mohamed Benrebia https://ipfinder.io/docs/
"
#######################################################################

####################################################SETUP#################################################################
setup () {
    echo -n -e  "$Yellow Do you want setup (y/n)?"
    ssty=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $ssty
    if echo "$answer" | grep -iq "^y" ;then
        echo -n  -e "\n$Yellow Give your domain name to start setup (e.g. google.com, facebook.com)?"
        read input_variable
        if [[ -z "$input_variable" ]]; then
           echo -n  -e '%s\n' "$Red No input entered"
           exit 1
        else
           echo "########################################################"
           echo -n  -e "$Red ✓ You entered >> " "$Cyan $input_variable\n"
           echo "########################################################"
           ## change to fakedomain.io
           # find ../nginx -type f -exec sed -i 's/$input_variable/fakedomain.io/g' {} \;
           find ../nginx -type f -exec sed -i "s/fakedomain.io/$input_variable/g" {} \;

           sudo cp ../nginx/sites-available/fakedomain.io /etc/nginx/sites-available/$input_variable
           sudo cp ../nginx/sites-available/ipfinder.fakedomain.io /etc/nginx/sites-available/ipfinder.$input_variable
           sudo ln -s /etc/nginx/sites-available/$input_variable /etc/nginx/sites-enabled/
           sudo ln -s /etc/nginx/sites-available/ipfinder.$input_variable /etc/nginx/sites-enabled/
           sudo cp -R ../nginx/ipfinder.io/ /etc/nginx/
           sudo mkdir "/var/www/$input_variable" && sudo cp -R ../public/ /var/www/$input_variable/
           echo -n -e  "$Yellow ✓✓✓ setup Donne ✓✓✓\n"
           echo -n -e  "$Yellow ✓✓✓ setup Donne ✓✓✓\n"
           echo -n -e  "$Yellow ✓✓✓ setup Donne ✓✓✓\n"
           echo -n -e  "$Yellow ✓✓✓ setup Donne ✓✓✓\n"

        fi

    else
        echo -e "\n $Red No Bye "
    fi
}
#########################################################################################################################

setup
