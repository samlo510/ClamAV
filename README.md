# 🛡️ ClamAV Auto & Full Scan Suite for Ubuntu

This project automates antivirus scanning on Ubuntu using **ClamAV**.  
It includes two Bash scripts:

- **autoscan.sh** → Monitors your `~/下載` (Downloads) folder and scans new files automatically.  
- **fullscan.sh** → Performs a full system scan and logs results with timestamps.  

---

# 📂 Project Structure

/home/thts/Project/ClamAV   
├── Log/ # Directory to store all ClamAV scan logs  
├── clamav-full-scan.desktop # Desktop launcher for full system scan  
├── clamav-auto-scan.desktop # Desktop launcher for auto scan (Downloads folder)  
├── fullscan.sh # Bash script: full system scan  
└── autoscan.sh # Bash script: auto scan Downloads folder 

## ⚙️ Setup Instructions  
### Create directories  
```bash
mkdir -p /home/thts/Project/ClamAV  
mkdir -p /home/thts/Project/ClamAV/Log  
cd /home/thts/Project/ClamAV  
```
### Install ClamAV
```bash
sudo apt update  
sudo apt install clamav clamav-daemon -y  
```
### Manage Freshclam  
```bash
ps aux | grep freshclam  
sudo systemctl stop clamav-freshclam  
sudo freshclam  
```
### Install inotify-tools 
```bash
sudo apt install inotify-tools -y  
```
### Set permissions for scripts  
```bash
chmod +x fullscan.sh  
chmod +x autoscan.sh  
```
### Run auto-scan
```bash
./autoscan.sh  
```
# ⏱️ ClamAV Full System Scan Duration (Ubuntu)

The duration of a full system scan with ClamAV varies depending on disk size, file count, and hardware performance.  
Below are **estimated times** based on community reports and typical hardware.

| System Size | Approx. File Count | Hardware Example | Estimated Duration |
|-------------|--------------------|------------------|-------------------|
| 50 GB       | ~500k files        | SSD, 4‑core CPU  | 20–30 minutes     |
| 100 GB      | ~1M files          | SSD, 4‑core CPU  | 40–60 minutes     |
| 500 GB      | ~3M files          | HDD, 4‑core CPU  | 2–3 hours         |
| 1 TB        | ~6M files          | HDD, 8‑core CPU  | 4–6 hours         |
| 2 TB+       | 10M+ files         | HDD/RAID, server | 8+ hours          |

> ⚠️ **Note:** These are approximate values. Actual scan times vary depending on:
> - Disk type (SSD vs HDD)
> - CPU speed and cores
> - Number of small files vs large files
> - Whether the ClamAV database is up‑to‑date
> - System load during scanning




# 🖥️ Installing ClamAV Desktop Launchers

## 📂 Per‑User Installation (preferred)

### This installs the launchers only for your account:

### Validate
    desktop-file-validate clamav-full-scan.desktop  
    desktop-file-validate clamav-auto-scan.desktop  

### Install into ~/.local/share/applications/  
    desktop-file-install --dir=$HOME/.local/share/applications clamav-full-scan.desktop  
    desktop-file-install --dir=$HOME/.local/share/applications clamav-auto-scan.desktop  

### Update desktop database
    update-desktop-database ~/.local/share/applications  

### Make executable
    chmod +x ~/.local/share/applications/clamav-full-scan.desktop  
    chmod +x ~/.local/share/applications/clamav-auto-scan.desktop  

## 🌍 System‑Wide Installation

### This installs the launchers for all users on the system:

### Validate
    desktop-file-validate clamav-full-scan.desktop  
    desktop-file-validate clamav-auto-scan.desktop  

### Install into /usr/share/applications/
    sudo desktop-file-install --dir=/usr/share/applications clamav-full-scan.desktop  
    sudo desktop-file-install --dir=/usr/share/applications clamav-auto-scan.desktop  

### Update desktop database
    sudo update-desktop-database /usr/share/applications  

### Make executable
    sudo chmod +x /usr/share/applications/clamav-full-scan.desktop  
    sudo chmod +x /usr/share/applications/clamav-auto-scan.desktop  

## 🧪 Test

Search for ClamAV Full System Scan or ClamAV Auto Scan in your application menu. Or copy them to your desktop for double‑click shortcuts:

    cp ~/.local/share/applications/clamav-full-scan.desktop ~/Desktop/  
    cp ~/.local/share/applications/clamav-auto-scan.desktop ~/Desktop/  
    chmod +x ~/Desktop/clamav-full-scan.desktop  
    chmod +x ~/Desktop/clamav-auto-scan.desktop  

## 🗑️ Uninstall

### Per‑user:

    rm ~/.local/share/applications/clamav-full-scan.desktop  
    rm ~/.local/share/applications/clamav-auto-scan.desktop  
    update-desktop-database ~/.local/share/applications  

### System‑wide:

    sudo rm /usr/share/applications/clamav-full-scan.desktop  
    sudo rm /usr/share/applications/clamav-auto-scan.desktop  
    sudo update-desktop-database /usr/share/applications/  

### Desktop shortcuts:
    
    rm ~/Desktop/clamav-full-scan.desktop  
    rm ~/Desktop/clamav-auto-scan.desktop  
    
## 🔮 Future Plans
We aim to extend the ClamAV Auto & Full Scan Project with the following improvements:
- **Scheduled Scans**  
  Add cron jobs to run `fullscan.sh` automatically (e.g., nightly at 2 AM).
