#!/usr/bin/env bash

echo "The script installs Brave-Browser included a set of json settings."
echo "The script must be executed as root."
echo "Press ENTER to continue, or press STRG+C to abort."
read

apt install curl -y
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser -y

mkdir -p /etc/brave/policies/managed
wget -O /etc/brave/policies/managed/privacy.json https://git.osit.cc/public-projects/pbp/-/raw/main/privacy.json
wget -O /etc/brave/policies/managed/privacy-extra-brave.json https://git.osit.cc/public-projects/pbp/-/raw/main/privacy-extra-brave.json
wget -O /etc/brave/policies/managed/allowed-cookies.json https://git.osit.cc/public-projects/pbp/-/raw/main/allowed-cookies.json
wget -O /etc/brave/policies/managed/forced-extensions-brave.json https://git.osit.cc/public-projects/pbp/-/raw/main/forced-extensions-brave.json
wget -O /etc/brave/policies/managed/general.json https://git.osit.cc/public-projects/pbp/-/raw/main/general.json