#!/bin/bash

# if not root, run as root do not modify below unless making direct path to file in line 5. 
if (( EUID != 0 )); then
    sudo ~/ubuntu-proxy-install.sh
    exit
fi

## Change the next line down 'export a_proxy=http://myserver.com:port or a_proxy=http://ipaddy:port, as that sets the rest of the file for success...
## Remember this is a bash/shell script and has been vetted through the ShellCheck.net script checker... also please remember you will need to make executable...
## command: sudo chmod 755 ubuntu-proxy-install.sh
##                                                                    or
##          sudo chmod +x ubuntu-proxy-install.sh
## So please contribute if you feel something can be added to this script... Thank you -SomeGuru

## Setup information
export a_proxy=http://xxx.xxx.xxx.xxx:80
export f_proxy=ftp://xxx.xxx.xxx.xxx:91
export s_proxy=http://proxy-dmz.xxx.xxx.xxx:1080
export http_proxy=${a_proxy}
export https_proxy=${a_proxy}
export ftp_proxy=${f_proxy}
export socks_proxy=${s_proxy}

## etc/environment Information
sudo echo "export a_proxy=${a_proxy}" >> /etc/environment
sudo echo "export http_proxy=${a_proxy}" >> /etc/environment
sudo echo "export https_proxy=${a_proxy}" >> /etc/environment
sudo echo "export ftp_proxy=${f_proxy}" >> /etc/environment
sudo echo "export socks_proxy=${s_proxy}" >> /etc/environment

## apt.conf Information
sudo echo 'Acquire::http::proxy "${a_proxy}";' >> /etc/apt/apt.conf
sudo echo 'Acquire::https::proxy "${a_proxy};' >> /etc/apt/apt.conf
sudo echo 'Acquire::ftp::proxy "${f_proxy};' >> /etc/apt/apt.conf
sudo echo 'Acquire::socks::proxy "${s_proxy};' >> /etc/apt/apt.conf

## etc/wgetrc Information
sudo echo "export a_proxy=${a_proxy}" >> /etc/wgetrc
sudo echo "export http_proxy=${a_proxy}" >> /etc/wgetrc
sudo echo "export https_proxy=${a_proxy}" >> /etc/wgetrc
sudo echo "export ftp_proxy=${f_proxy}" >> /etc/wgetrc
sudo echo "export socks_proxy=${s_proxy}" >> /etc/wgetrc

## fields needing changes are /etc/bash.bashrc
## fields needing changes is /etc/environment
