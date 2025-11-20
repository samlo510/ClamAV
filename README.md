# ClamAV for Ubuntu

1. mkdir /home/thts/Project/ClamAV  
2. mkdir /home/thts/Project/ClamAV/Log   
3. cd /home/thts/Project/ClamAV  
4. sudo apt update  
5. sudo apt install clamav clamav-daemon -y  
6. ps aux | grep freshclam  
7. sudo systemctl stop clamav-freshclam  
8. sudo freshclam  
9. sudo apt install inotify-tools -y  
10. chmod +x fullscan.sh  
11. chmod +x autoscan.sh  
12. ./autoscan.sh  
