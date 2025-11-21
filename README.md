# 🛡️ ClamAV Auto & Full Scan Suite for Ubuntu

This project automates antivirus scanning on Ubuntu using **ClamAV**.  
It includes two Bash scripts:

- **autoscan.sh** → Monitors your `~/下載` (Downloads) folder and scans new files automatically.  
- **fullscan.sh** → Performs a full system scan and logs results with timestamps.  

---

## 📂 Project Structure

/home/thts/Project/ClamAV  
├── Log/  
├── clamav-full-scan.desktop  
├── clamav-auto-scan.desktop  
├── fullscan.sh   
└── autoscan.sh  

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

## 🔮 Future Plans
We aim to extend the ClamAV Auto & Full Scan Project with the following improvements:
- **Scheduled Scans**  
  Add cron jobs to run `fullscan.sh` automatically (e.g., nightly at 2 AM).
