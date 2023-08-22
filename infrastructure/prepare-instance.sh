#!/bin/bash
set -e

sudo apt update
sudo apt upgrade -y
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

sudo apt install nodejs curl -y
sudo /home/ubuntu

cd /home/ubuntu
git clone https://github.com/Ansam-02/-BookManagement-on-AWS.git
cd app && npm install
npm run build

sudo mv ./infrastructure/app.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable app.service
sudo reboot




#!/bin/sh
set -e

sudo apt update
sudo apt upgrade -y

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs jq curl -y

sudo useradd --system --create-home --shell /usr/sbin/nologin app
sudo useradd -g app --no-create-home --no-user-group --home-dir /home/app --shell /bin/bash github
sudo usermod --append --groups app github



repo="Ansam-02/BookManagementSystem"

download_url=$(curl "https://api.github.com/repos/$repo/releases/latest" | jq --raw-output '.assets[0].browser_download_url')

curl -O "https://raw.githubusercontent.com/$repo/infrastructure/app.service"

sudo mv app.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable app.service

sudo -u app sh -c "mkdir -p /home/app/app && cd /home/app/app && curl -LO $download_url  && tar xzvf app.tar.gz  && npm install --omit=dev"

sudo reboot
