#!/bin/bash
set -e

sudo apt update
sudo apt upgrade -y
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

sudo apt install nodejs curl -y
sudo /home/ansam

cd /home/ansam
git clone https://github.com/Ansam-02/BookManagementSystem
cd app && npm install
npm run build
