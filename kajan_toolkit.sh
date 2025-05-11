#!/bin/bash
# KAJAN - Ethical Hacking Toolkit
# Author: Kajan
# For educational and legal use only

# ---------- ASCII BANNER ----------
echo -e "\e[1;32m"
echo "██╗  ██╗ █████╗      ██╗ █████╗ ███╗   ██╗"
echo "██║ ██╔╝██╔══██╗    ██╔╝██╔══██╗████╗  ██║"
echo "█████╔╝ ███████║   ██╔╝ ███████║██╔██╗ ██║"
echo "██╔═██╗ ██╔══██║  ██╔╝  ██╔══██║██║╚██╗██║"
echo "██║  ██╗██║  ██║ ██╔╝   ██║  ██║██║ ╚████║"
echo "╚═╝  ╚═╝╚═╝  ╚═╝ ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═══╝"
echo "     💻 KAJAN - Ethical Toolkit v1.0 💻"
echo -e "\e[0m"

# ---------- MENU ----------
echo ""
echo "Choose an option:"
echo "1⃣1SSH Password Guessing (Hydra)"
echo "2️2 Basic Nmap Scan"
echo "3️3 Whois Domain Lookup"
echo "44 Subdomain Enumeration"
echo "5️5 Exit"
read -p "Enter your choice (1-5): " choice

# ---------- FUNCTIONS ----------
function password_guess() {
  read -p "Enter Target IP: " TARGET
  read -p "Enter Username: " USER
  WORDLIST="/usr/share/wordlists/rockyou.txt"
  echo "Launching Hydra attack on $TARGET..."
  hydra -l "$USER" -P "$WORDLIST" ssh://"$TARGET"
}

function run_nmap() {
  read -p "Enter target IP or domain: " TARGET
  echo "Running basic Nmap scan..."
  nmap -sV "$TARGET"
}

function whois_lookup() {
  read -p "Enter domain name: " DOMAIN
  echo "Whois lookup for $DOMAIN:"
  whois "$DOMAIN"
}

function subdomain_enum() {
  read -p "Enter domain: " DOMAIN
  if command -v sublist3r &> /dev/null; then
    sublist3r -d "$DOMAIN"
  else
    echo "Sublist3r not installed. Run: sudo apt install sublist3r"
  fi
}

# ---------- EXECUTE CHOICE ----------
case $choice in
  1)
    password_guess
    ;;
  2)
    run_nmap
    ;;
  3)
    whois_lookup
    ;;
  4)
    subdomain_enum
    ;;
  5)
    echo "Exiting KAJAN Toolkit. Stay legal and safe!"
    exit 0
    ;;
  *)
    echo "Invalid choice. Run the script again."
    ;;
esac
