# ClamAV for Ubuntu

mkdir /home/thts/Project/ClamAV
mkdir /home/thts/Project/ClamAV/Log
cd /home/thts/Project/ClamAV
sudo apt update
sudo apt install clamav clamav-daemon -y
ps aux | grep freshclam
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo apt install inotify-tools -y
chmod +x fullscan.sh
chmod +x autoscan.sh
./autoscan.sh
