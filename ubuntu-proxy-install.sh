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

export a_proxy=http://xxx.xxx.xxx.xxx:80
export http_proxy=${a_proxy}
export https_proxy=${a_proxy}
export ftp_proxy=${a_proxy}

sudo echo 'Acquire::http::Proxy "${a_proxy}";' >> /etc/apt/apt.conf

sudo echo "export a_proxy=${a_proxy}" >> /etc/environment
sudo echo "export http_proxy=${a_proxy}" >> /etc/environment
sudo echo "export https_proxy=${a_proxy}" >> /etc/environment
sudo echo "export ftp_proxy=${a_proxy}" >> /etc/environment
