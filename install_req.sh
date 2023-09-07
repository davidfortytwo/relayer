#!/bin/bash

f_banner(){

echo
echo "

██████╗ ███████╗██╗      █████╗ ██╗   ██╗███████╗██████╗
██╔══██╗██╔════╝██║     ██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗
██████╔╝█████╗  ██║     ███████║ ╚████╔╝ █████╗  ██████╔╝
██╔══██╗██╔══╝  ██║     ██╔══██║  ╚██╔╝  ██╔══╝  ██╔══██╗
██║  ██║███████╗███████╗██║  ██║   ██║   ███████╗██║  ██║
╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

SMB Relay Script
By Jason Soto "
echo
echo

}

echo "Checking dependencies for Relayer"

command -v responder >/dev/null 2>&1
if [ $? -eq 0 ]; then
  echo ""
  echo "Responder already installed"
else
  echo ""
  echo "Responder not installed, Installing"
#  apt-get install responder
# Install dependencies
  sudo apt-get update
  sudo apt-get install -y git python python-pip python-dev screen sqlite3
  # Clone and install Responder from GitHub
  git clone https://github.com/lgandx/Responder.git
  cd Responder
  sudo python setup.py install
  cd ..
fi

command -v nmap >/dev/null 2>&1
if [ $? -eq 0 ]; then
  echo ""
  echo "Nmap already installed"
else
  echo ""
  echo "Nmap not installed, Installing"
  apt-get install nmap
fi


command -v smbrelayx.py >/dev/null 2>&1
if [ $? -eq 0 ]; then
  echo ""
  echo "smbrelayx already installed"
else
  echo ""
  echo "smbrelayx not installed, Cloning impacket and Setting up"
  git clone https://github.com/coresecurity/impacket
  pip install -r impacket/requirements.txt
  cd impacket/
  python setup.py install
  cd ..
fi


command -v msfconsole >/dev/null 2>&1
if [ $? -eq 0 ]; then
  echo ""
  echo "msfconsole already installed"
else
  echo ""
  echo "msfconsole not installed, Installing Metasploit-Framework"
  apt-get install metasploit-framework
fi


if [ -d unicorn/ ]; then
  echo ""
  echo "Unicorn is present"
else
  echo ""
  echo "Unicorn is not present, Cloning Unicorn"
  git clone https://github.com/trustedsec/unicorn
fi

if [ -d ps1encode/ ]; then
  echo ""
  echo "Ps1encode is present"
else
  echo ""
  echo "Ps1encode is not present, Cloning Ps1encode"
  git clone https://github.com/CroweCybersecurity/ps1encode
fi

echo ""
echo "Relayer is ready to Run"
