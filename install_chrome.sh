#!/bin/bash

# Basics
sudo sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
sudo sed -i 's/security.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
sudo apt-get update 


# Settup download directory 
sudo mkdir download 
cd download 

# Installing Chrome 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install -y ./google-chrome-stable_current_amd64.deb

# Download chromedriver 
# Check proper driver at https://chromedriver.chromium.org/downloads
wget https://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip
unzip chromedriver_linux64.zip


# Move driver to usr/bin/ 
sudo mv chromedriver /usr/bin/chromedriver 
sudo chown root:root /usr/bin/chromedriver 
sudo chmod +x /usr/bin/chromedriver

# Install Selenium
pip install selenium

# Cleanup 

cd .. 
sudo rm -rf download 
