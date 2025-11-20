# 🛡️ ClamAV Auto & Full Scan Suite for Ubuntu

This project automates antivirus scanning on Ubuntu using **ClamAV**.  
It includes two Bash scripts:

- **autoscan.sh** → Monitors your `~/下載` (Downloads) folder and scans new files automatically.  
- **fullscan.sh** → Performs a full system scan and logs results with timestamps.  

---

## 📂 Project Structure

/home/thts/Project/ClamAV  
├── autoscan.sh  
├── fullscan.sh  
└── Log/  

## ⚙️ Setup Instructions  
### Create directories  
```bash
  mkdir /home/thts/Project/ClamAV  
  mkdir /home/thts/Project/ClamAV/Log  
  cd /home/thts/Project/ClamAV  
```
### Install ClamAV
    sudo apt update  
    sudo apt install clamav clamav-daemon -y  

### Manage Freshclam  
    ps aux | grep freshclam  
    sudo systemctl stop clamav-freshclam  
    sudo freshclam  

### Install inotify-tools 
    sudo apt install inotify-tools -y  

### Set permissions for scripts  
    chmod +x fullscan.sh  
    chmod +x autoscan.sh  

### Run auto-scan  
    ./autoscan.sh  
