#/bin/sh

#
#
#
# install requirement >> php7.2 nginx
#
#

## COLOR
clear
Color_Off='\033[0m'


Red='\033[0;31m'
Cyan='\033[0;36m'


install_requirement () {
    echo -e "$Cyan Do you want install requirement (y/n)? "
    ssty=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $ssty
    if echo "$answer" | grep -iq "^y" ;then
        echo -e "$Red Please add your pass "
        sudo apt install nginx php7.2 php7.2-cli php7.2-fpm php7.2-curl php7.2-zip php7.2-xml php7.2-mbstring
        echo -n -e  "$Yellow ✓✓✓ install Donne ✓✓✓\n"
        echo -n -e  "$Yellow ✓✓✓ install Donne ✓✓✓\n"
        echo -n -e  "$Yellow ✓✓✓ install Donne ✓✓✓\n"
        echo -n -e  "$Yellow ✓✓✓ install Donne ✓✓✓\n"
    else
        echo -e "\n $Red No Bye "
    fi
}


install_requirement
