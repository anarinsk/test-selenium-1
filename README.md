# Preparing to use selenium in jupyter-docker 

## Problem 

- 파이썬에서 셀레니움을 구동하는 것이 최소한의 목적이다. 
- 셀레니엄을 기반으로 한 도커에 파이썬과 주피터를 설치하는지, 아니면 반대로 할지가 문제 
- 여기서는 반대로 했다. 즉, 파이썬+주피커 도커에 셀레니엄을 설정할 수 있는 sh를 제작 

## sh file 

```code 
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
```

## Rerence 
[https://medium.com/@jonathan.turnock/selenium-recipes-with-python-automate-web-scraping-to-testing-d5ccda1a2403](https://medium.com/@jonathan.turnock/selenium-recipes-with-python-automate-web-scraping-to-testing-d5ccda1a2403)

[https://oslinux.tistory.com/33](https://oslinux.tistory.com/33)

[https://chromedriver.chromium.org/downloads](https://chromedriver.chromium.org/downloads)
