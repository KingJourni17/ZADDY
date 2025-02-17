#!/bin/bash

echo "[+] Updating system..."
sudo apt update -y
sudo apt upgrade -y

echo "[+] Installing required packages..."
sudo apt install -y tor proxychains nmap sqlmap gobuster sublist3r \
                    exiftool theHarvester whois nikto owasp-zap curl wpscan \
                    dirsearch hydra waybackurls metasploit-framework \
                    hping3 slowloris python3-pip figlet ffmpeg \
                    python3-flask python3-speechrecognition python3-pyaudio git

echo "[+] Installing Python dependencies..."
pip3 install torpy requests beautifulsoup4 scikit-learn pandas numpy tqdm \
              slack-sdk telepot smtplib opencv-python flask SpeechRecognition pyaudio

echo "[✔] Installation Complete!"
