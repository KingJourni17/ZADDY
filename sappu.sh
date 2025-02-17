#!/bin/bash

# ===================================================
#  🔥 ZADDY v14.1: AI-Powered Cybersecurity Framework & GitHub-Ready
#  Created by: KingJourni17 | Version: 14.1.0
# ===================================================

# 🛠 Key:
# 🟥 Red   - Open Ports
# 🟦 Blue  - Service Information
# 🟩 Green - OS Details
# 🟨 Yellow - Vulnerabilities
# ⚪ White - General Info
# 🟪 Purple - Exploitation & C2 Control
# 🚀 Orange - Real-time Attack Visualization
# 🕵️ Dark Gray - AI-Powered Dark Web Intelligence
# 📷 Cyan - WiFi Camera Access & Vulnerability Testing
# 🎙️ Magenta - Voice-Controlled Execution
# 📊 Light Blue - Live Attack Dashboard

# Define Color Codes
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
WHITE='\033[1;37m'
ORANGE='\033[1;33m'
DARKGRAY='\033[1;30m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
LIGHTBLUE='\033[1;34m'
NC='\033[0m' # No Color

# Define GitHub Repository URL
GITHUB_REPO="https://github.com/KingJourni17/ZADDY"

# Ensure Logs Directory Exists
LOG_DIR="pentest_results"
mkdir -p $LOG_DIR

# Root Check
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}[-] This script must be run as root!${NC}"
   exit 1
fi

# Install Dependencies Automatically
install_dependencies() {
    echo -e "${YELLOW}[+] Installing required tools...${NC}"
    sudo apt update
    sudo apt install -y tor proxychains nmap sqlmap gobuster sublist3r exiftool theHarvester whois nikto \
        owasp-zap curl wpscan dirsearch hydra waybackurls metasploit-framework hping3 slowloris \
        python3-pip figlet ffmpeg python3-flask python3-speechrecognition python3-pyaudio git
    pip3 install torpy requests beautifulsoup4 scikit-learn pandas numpy tqdm slack-sdk telepot smtplib opencv-python flask SpeechRecognition pyaudio
    echo -e "${GREEN}[+] All dependencies installed.${NC}"
}

# Function: AI Dark Web Threat Intelligence
ai_darkweb_monitoring() {
    echo -e "${DARKGRAY}[+] Scanning Dark Web for Threats...${NC}"
    proxychains curl -x socks5h://127.0.0.1:9050 "http://ahmia.fi/search/?q=exploits" | tee "$LOG_DIR/darkweb_results.txt"
}

# Function: OSINT & Recon
data_gathering() {
    echo -e "${YELLOW}[+] Running OSINT and Recon...${NC}"
    theHarvester -d target.com -b all | tee "$LOG_DIR/osint_results.txt"
}

# Function: Exploitation & Payload Deployment
exploitation() {
    echo -e "${PURPLE}[+] Running Exploitation and Payload Deployment...${NC}"
    msfconsole -q -x "use exploit/multi/handler; set LHOST 127.0.0.1; set LPORT 4444; run" | tee "$LOG_DIR/exploit_results.txt"
}

# Function: Command & Control (C2)
c2_control() {
    echo -e "${PURPLE}[+] Launching C2 Control Panel...${NC}"
    msfconsole -q | tee "$LOG_DIR/c2_results.txt"
}

# Function: WiFi Camera Scan & Exploitation
wifi_camera_scan() {
    echo -e "${CYAN}[+] Scanning for WiFi Cameras...${NC}"
    nmap -p 554 --open -sV 192.168.1.0/24 | tee "$LOG_DIR/wifi_cameras.txt"
}

wifi_camera_access() {
    echo -e "${CYAN}[+] Attempting to Access WiFi Cameras...${NC}"
    IP=$(grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' "$LOG_DIR/wifi_cameras.txt")
    for ip in $IP; do
        echo -e "${CYAN}[+] Accessing Camera at $ip${NC}"
        ffmpeg -i "rtsp://$ip:554/live" -f mpegts udp://localhost:1234
    done
}

# Function: Launch Real-Time Dashboard
launch_dashboard() {
    echo -e "${LIGHTBLUE}[+] Launching Real-Time Attack Dashboard...${NC}"
    python3 -m flask run --host=0.0.0.0 --port=5000
}

# Function: Voice-Controlled Execution
voice_control() {
    echo -e "${MAGENTA}[+] Activating Voice Control...${NC}"
    python3 - <<END
import speech_recognition as sr
import os

recognizer = sr.Recognizer()
mic = sr.Microphone()

def execute_command(command):
    if "status" in command:
        print("ZADDY is online and ready.")
    elif "launch attack" in command:
        print("Launching attack...")
        os.system("sudo ./zaddy.sh")
    elif "shutdown" in command:
        print("Shutting down ZADDY...")
        os.system("shutdown now")
    else:
        print("Unknown command.")

print("Listening for voice commands...")

while True:
    with mic as source:
        recognizer.adjust_for_ambient_noise(source)
        audio = recognizer.listen(source)

    try:
        command = recognizer.recognize_google(audio).lower()
        print(f"Received command: {command}")
        execute_command(command)
    except sr.UnknownValueError:
        print("Could not understand audio.")
    except sr.RequestError:
        print("Speech recognition service unavailable.")
END
}

# Function: GitHub Deployment
deploy_from_github() {
    echo -e "${LIGHTBLUE}[+] Deploying ZADDY from GitHub...${NC}"
    git clone $GITHUB_REPO ZADDY || (cd ZADDY && git pull)
    cd ZADDY && chmod +x zaddy.sh && sudo ./zaddy.sh
}

# Function: Generate Report
generate_report() {
    cat "$LOG_DIR"/* > "$LOG_DIR/zaddy_report.txt"
}

# 📌 Display Attack Options
clear
figlet "ZADDY v14.1"
echo -e "${BLUE}=====================================${NC}"
echo -e "${YELLOW}     🔥 ZADDY: Choose Your Attack   ${NC}"
echo -e "${BLUE}=====================================${NC}"
echo -e "🟩 1. AI-Powered Dark Web Threat Intelligence"
echo -e "🟨 2. OSINT & Recon"
echo -e "🟦 3. Exploitation & Payload Deployment"
echo -e "🟪 4. C2 Control (Empire, Metasploit, Cobalt Strike)"
echo -e "📷 5. WiFi Camera Access & Vulnerability Testing"
echo -e "📊 6. Real-Time Attack Dashboard"
echo -e "🎙️ 7. Voice-Controlled Execution"
echo -e "🚀 8. Deploy & Update from GitHub"
echo -e "📄 9. Generate Report"
read -p "$(echo -e ${BLUE}[+] Choose an option: ${NC})" option

# Execute Based on User Choice
case $option in
    1) ai_darkweb_monitoring ;;
    2) data_gathering ;;
    3) exploitation ;;
    4) c2_control ;;
    5) wifi_camera_scan && wifi_camera_access ;;
    6) launch_dashboard ;;
    7) voice_control ;;
    8) deploy_from_github ;;
    9) generate_report ;;
    *) echo -e "${RED}[-] Invalid option${NC}" ;;
esac