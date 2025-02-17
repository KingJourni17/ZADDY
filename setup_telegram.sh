#!/bin/bash

echo "[+] Setting up Telegram Bot for Remote Execution..."

read -p "Enter your Telegram Bot Token: " BOT_TOKEN
read -p "Enter your Telegram Chat ID: " CHAT_ID

echo "BOT_TOKEN='$BOT_TOKEN'" > telegram_config.sh
echo "CHAT_ID='$CHAT_ID'" >> telegram_config.sh

echo "[✔] Telegram Bot Configured!"
