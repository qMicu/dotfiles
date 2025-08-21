# Dotfiles Management with Stow

Acest repository conține fișierele de configurație (dotfiles) pentru un mediu de lucru bazat pe Hyprland.

## 📦 Aplicații incluse

- **Hyprland** - Window Manager
- **Kitty** - Terminal emulator
- **Waybar** - Status bar
- **wofi** - Application launcher
- **wlogout** - Logout menu
- **Hyprpaper** - Wallpaper utility
- **Hyprlock** - Screen locker
- **GTK** - Configurații pentru aplicațiile GTK
- **Qt5** - Configurații pentru aplicațiile Qt5

## 🗂️ Organizare

Fiecare aplicație are propriul director:
```
dotfiles/
├── hyprland/
│   └── .config/hypr/hyprland.conf
├── kitty/
│   └── .config/kitty/kitty.conf
├── waybar/
│   └── .config/waybar/config
├── wofi/
│   └── .config/wofi/
├── wlogout/
│   └── .config/wlogout/
├── hyprpaper/
│   └── .config/hyprpaper/
├── hyprlock/
│   └── .config/hyprlock/
├── gtk/
│   └── .config/gtk-3.0/
└── qt5/
    └── .config/qt5ct/
```

## 🚀 Instalare cu Stow

### Cerințe preliminare
Asigurați-vă că aveți instalat `stow`:
```bash
sudo pacman -S stow    # pentru Arch Linux
sudo apt install stow  # pentru Debian/Ubuntu
```

### Instalare configurații

1. Clonează repository-ul:
```bash
git clone <url-repository> ~/dotfiles
cd ~/dotfiles
```

2. Instalează configurațiile utilizând stow:
```bash
# Pentru a instala toate configurațiile:
stow */

# Sau pentru a instala configurații individuale:
stow hyprland
stow kitty
stow waybar
# ... etc.
```

3. (Opțional) Pentru a elimina configurațiile:
```bash
stow -D hyprland  # pentru a elimina doar hyprland
stow -D */       # pentru a elimina toate
```

## 🔧 Personalizare

1. Modifică fișierele de configurație din directoarele respective
2. Asigură-te că toate căile relative sunt corecte
3. Reinstalează cu stow pentru a aplica modificările

## 📝 Note importante

- Asigură-te că ai back-up la configurațiile existente înainte de instalare
- Unele aplicații necesită repornire sau reîncărcare a configurației
- Verifică dependințele fiecărei aplicații înainte de utilizare

## ❓ Suport

Pentru probleme sau întrebări, verificați documentația fiecărei aplicații sau creați un issue în repository.
