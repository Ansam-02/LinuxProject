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

sudo mv ./infrastructure/app.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable app.service
sudo reboot#!/bin/bash
set -e

# Update and upgrade packages
sudo apt update
sudo apt upgrade -y

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install nodejs -y

# Change to the appropriate directory (if necessary)
cd /home/ansam/app

# Install application dependencies and build
cd app && npm install
npm run build

# Move the systemd unit file to the correct location
sudo mv ./infrastructure/app.service /etc/systemd/system/

# Reload systemd and enable the service
sudo systemctl daemon-reload
sudo systemctl enable app.service

# Start the service (if desired, comment this out if you want to manually start)
sudo systemctl start app.service

# Note: You can choose whether or not to reboot here
# If you decide to reboot, uncomment the line below
# sudo reboot


