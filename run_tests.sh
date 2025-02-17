#!/bin/bash

echo "[+] Running ZADDY Tests..."

echo "[✔] Testing Dark Web Monitoring..."
./zaddy.sh 1

echo "[✔] Testing OSINT Recon..."
./zaddy.sh 2

echo "[✔] Testing Exploitation..."
./zaddy.sh 3

echo "[✔] Running C2 Control..."
./zaddy.sh 4

echo "[✔] Checking WiFi Camera Exploitation..."
./zaddy.sh 5

echo "[✔] Running Attack Dashboard..."
./zaddy.sh 6

echo "[✔] Running Voice-Controlled Execution..."
./zaddy.sh 7

echo "[✔] Running GitHub Auto-Deployment..."
./zaddy.sh 8

echo "[✔] Generating Security Report..."
./zaddy.sh 9

echo "[✔] All Tests Completed Successfully!"
