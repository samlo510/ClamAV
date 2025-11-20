# ClamAV for Ubuntu  

### Create directories  
1. mkdir /home/thts/Project/ClamAV  
2. mkdir /home/thts/Project/ClamAV/Log  
3. cd /home/thts/Project/ClamAV  

### Install ClamAV  
4. sudo apt update  
5. sudo apt install clamav clamav-daemon -y  

### Manage Freshclam  
6. ps aux | grep freshclam  
7. sudo systemctl stop clamav-freshclam  
8. sudo freshclam  

### Install inotify-tools  
9. sudo apt install inotify-tools -y  

### Set permissions for scripts  
10. chmod +x fullscan.sh  
11. chmod +x autoscan.sh  

### Run auto-scan  
12. ./autoscan.sh  
