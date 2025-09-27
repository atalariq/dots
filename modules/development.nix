# development.nix - A Comprehensive, Multi-Language Development Environment
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # --- CORE TOOLS ---
    # neovim       # Managed with NixVim (see ../home/base/neovim/default.nix)
    age          # Alat enkripsi file yang sederhana dan modern.
    firefox-bin  # For DevTools, and hacking purpose (Zap)
    git          # Sistem kontrol versi yang esensial.
    gh
    httpie
    just         # Task runner modern, alternatif 'make'. Sangat bagus untuk resep perintah.
    lazygit      # TUI (Text-based User Interface) untuk Git. Membuat Git jadi jauh lebih mudah.
    # vscodium     # Editor kode utama Anda.
    # xh

    # --- DOCUMENT ---
    tinymist     # Language Server untuk Typst.
    typst        # Sistem typesetting modern, alternatif LaTeX.
    typst-live   # Pratinjau dokumen Typst secara live di browser.
    typstyle     # Formatter untuk kode Typst.
    
    # --- DEVELOPMENT ---
    clang-tools  # Termasuk clangd, Language Server yang sangat baik untuk C++.
    # cmake        # Build system generator lintas platform.
    fnm          # Node Package manager
    gdb          # GNU Debugger.
    gef
    rustup       # Rust toolchain installer. Ini akan mengelola rustc, cargo, clippy, dll.
    uv           # Python project and package manager
    # vfox         # Extendable version manager
  ];
}
