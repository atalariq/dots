# hacking.nix - Starter Pack for Cybersecurity Learning
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # --- UTILITIES (WAJIB PUNYA) ---
    # Tools dasar yang akan selalu Anda gunakan.
    btop             # Monitor proses sistem yang canggih.
    whois            # Mencari informasi registrasi domain.
    proxychains-ng   # Merutekan koneksi melalui proxy.
    p7zip            # Ekstrak file .7z

    # --- RECONNAISSANCE & SCANNING ---
    # Cornerstone (batu penjuru) dari setiap pentest.
    amass            # Alternatif subfinder yang lebih mendalam.
    nmap             # Network mapper, raja dari port scanner. Sangat esensial.
    theharvester     # Mengumpulkan email, subdomain, host dari berbagai sumber publik.
    whatweb          # Mengidentifikasi teknologi yang digunakan oleh sebuah website.

    # --- WEB APPLICATION SECURITY ---
    # Fokus utama Anda, mengingat minat pada WebDev & Web3.
    # (Manual) # burpsuite        # Swiss Army knife untuk pentest web. Wajib.
    # (Manual) #zap              # ZAP Proxy, alternatif open-source untuk Burp Suite. Fokus pada satu dulu.
    # mitmproxy        # Alternatif Burp Suite untuk command-line. Burp lebih mudah untuk memulai.
    dalfox           # Pencari kerentanan XSS (Cross-Site Scripting) yang canggih.
    feroxbuster      # Alternatif gobuster/ffuf lain yang ditulis di Rust.
    httpx            # HTTP toolkit serbaguna (probe, ambil judul, status code, dll).
    nikto            # Web server scanner untuk mencari file/program berbahaya.
    nuclei           # Vulnerability scanner modern berbasis template. Sangat kuat.
    sqlmap           # Mendeteksi dan mengeksploitasi kerentanan SQL Injection secara otomatis.
    wpscan           # Scanner kerentanan khusus untuk WordPress.

    # # --- PASSWORD ATTACKS ---
    # # Memahami cara kerja password cracking itu fundamental.
    # crunch           # Generator wordlist.
    # hashcat          # Password cracker berbasis GPU. Standar industri.
    # hashcat-utils
    # john             # John the Ripper, password cracker klasik (CPU).
    # thc-hydra        # Brute-force login online (SSH, FTP, HTTP, dll).

    # # --- NETWORK ANALYSIS & EXPLOITATION ---
    # # Untuk melihat apa yang terjadi di jaringan dan mengambil langkah selanjutnya.
    # aircrack-ng      # Toolkit untuk audit keamanan Wi-Fi.
    # metasploit       # Framework eksploitasi paling terkenal di dunia.
    # wireshark        # Penganalisa protokol jaringan grafis. Sangat penting untuk belajar.

    # --- FORENSICS ---
    # acquire
    # afflib
    amoco
    # dcfldd
    # ddrescue
    # dislocker
    # dismember
    exiftool
    exiv2
    # foremost
    # gzrt
    # hivex
    # hstsparser
    noseyparker
    # ntfs3g
    # sleuthkit
    # srm
    # testdisk
    # volatility3
    # wipe
    # xorex
    zsteg

    # --- REVERSE ENGINEERING & FORENSICS (UNTUK MEMPERDALAM PEMAHAMAN) ---
    # Membantu Anda berpikir "outside the box".
    ghidra-bin       # Reverse engineering suite dari NSA. Gratis dan sangat kuat.
    radare2           # Alternatif Ghidra, Ghidra lebih user-friendly untuk pemula.
    binwalk          # Menganalisis dan mengekstrak file dari firmware.
    pwntools         # Framework CTF dan pengembangan eksploit untuk binary exploitation.

    # =============
    # Full List (https://fabaff.github.io/nix-security-box/list)
    
  ];
}
