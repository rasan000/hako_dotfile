# overview
My Setting File for Ubuntu24.04.(wsl)

# Prerequisites
Before running the setup, install the following on Windows:

## Nerd Font Installation (Required for Powerlevel10k theme)
1. Download a Nerd Font from: https://www.nerdfonts.com/font-downloads
   - Recommended: `JetBrainsMono Nerd Font` or `FiraCode Nerd Font`
2. Extract the downloaded zip file
3. Right-click on the font files (.ttf) and select "Install for all users"
4. Set the font in your terminal:
   - **Windows Terminal**: Settings → Profiles → Ubuntu → Appearance → Font face
   - **VSCode Terminal**: Settings → `terminal.integrated.fontFamily`

# command
- make setup     ->  Full setup (packages + dotfiles) 
- make packages  ->  Install packages only 
- make install   ->  Install dotfiles only 
- make clean     ->  Remove broken symlinks 
- make uninstall ->  Remove all symlinks 

# windows
- ime_controle.ahk-
  - win + R 
  - shell:startu 

- font
  - use MesloLGS NF Regular
  - <a>https://github.com/romkatv/powerlevel10k#fonts</a>
