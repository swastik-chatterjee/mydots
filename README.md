# mydots

> Personal Linux dotfiles for a fast, minimal, and highly customized Hyprland desktop.

## 🖥️ About

**mydots** is my personal Linux desktop configuration, built around **Hyprland on Arch Linux**.

The goal is simple:

> **The desktop should be fast, cohesive, and stay out of the way.**

Instead of using a large desktop environment, this setup combines focused Wayland applications into a complete desktop workflow.

Hyprland handles the compositor and window management, while Waybar, Ghostty, Mako, wlogout, and a collection of small utilities provide the rest of the desktop experience.

The configuration is intentionally personal. It reflects the applications, keybindings, appearance, and workflow that I actually use.

## ✨ Features

* **Hyprland** — dynamic tiling Wayland compositor
* **Waybar** — status bar
* **Ghostty** — terminal emulator
* **Mako** — notification daemon
* **wlogout** — graphical logout/power menu
* **Helix** — terminal editor
* **Geany** — lightweight GUI editor
* **GTK 3** — application theming
* **Fontconfig** — font configuration
* **nmgui** — graphical network management
* **Blueman** — Bluetooth management
* **brightnessctl** — hardware brightness control
* **Zenity** — graphical dialogs for scripts and utilities

## 🧱 Stack

| Category         | Software          |
| ---------------- | ----------------- |
| Operating System | **Arch Linux**    |
| Display Protocol | **Wayland**       |
| Compositor       | **Hyprland**      |
| Status Bar       | **Waybar**        |
| Terminal         | **Ghostty**       |
| Notifications    | **Mako**          |
| Power Menu       | **wlogout**       |
| Terminal Editor  | **Helix**         |
| GUI Editor       | **Geany**         |
| Network GUI      | **nmgui**         |
| Bluetooth GUI    | **Blueman**       |
| Brightness       | **brightnessctl** |
| Dialogs          | **Zenity**        |
| Toolkit          | **GTK 3**         |
| Fonts            | **Fontconfig**    |

## 📁 Repository Structure

```text
mydots/
├── fontconfig/     # Font configuration
├── geany/          # Geany configuration
├── ghostty/        # Ghostty terminal configuration
├── gtk-3.0/        # GTK 3 configuration and appearance
├── helix/          # Helix editor configuration
├── hypr/           # Hyprland configuration
├── mako/            # Mako notification configuration
├── wlogout/         # wlogout configuration
└── README.md
```

Some applications used by the desktop are runtime dependencies rather than dotfile directories.

For example, Waybar, `nmgui`, Blueman, `brightnessctl`, and Zenity are used by the desktop configuration but don't need their own top-level directories in this repository.

## 🎨 Design Philosophy

### Minimalism

I don't want a desktop environment to dictate how the entire system works.

Instead, each component has a focused responsibility.

```text
Hyprland       → windows
Waybar         → status
Ghostty        → terminal
Mako           → notifications
wlogout        → power/session actions
nmgui          → networking
Blueman        → Bluetooth
brightnessctl  → brightness
Zenity         → graphical dialogs
```

Small pieces, combined into one coherent desktop.

### ⚡ Performance

The setup favors lightweight applications and native Linux/Wayland tooling.

The goal isn't to minimize every byte at all costs — it's to avoid unnecessary layers while keeping the desktop responsive and pleasant to use.

### 🎯 Consistency

A good rice isn't just a compositor configuration.

The terminal, GTK applications, notifications, editor, status bar, dialogs, fonts, and system utilities should all feel like they belong to the same desktop.

### ⌨️ Keyboard-driven workflow

Hyprland provides the foundation for a keyboard-first workflow.

Applications, windows, workspaces, utilities, and system actions should be accessible quickly without constantly reaching for the mouse.

## 🚀 Installation

These are **personal dotfiles**, so they should not be blindly copied onto another system.

Clone the repository:

```bash
git clone https://github.com/swastik-chatterjee/mydots.git
cd mydots
```

Inspect the configuration and adapt machine-specific settings before installing it.

Typical configuration locations are:

```text
~/.config/hypr/
~/.config/waybar/
~/.config/ghostty/
~/.config/gtk-3.0/
~/.config/helix/
~/.config/mako/
~/.config/wlogout/
```

> **Important:** Review the configuration before copying it into `~/.config`. Monitor names, applications, paths, keybindings, and other settings may be specific to my machine.

## 📦 Dependencies

On Arch Linux, the main packages include:

```bash
sudo pacman -S \
    hyprland hyprlock hypridle hyprlauncher hyprpolkitagent xdg-desktop-portal-hyprland waybar ghostty mako wlogout helix geany blueman brightnessctl zenity && yay -S nmgui-bin
```

Network management requires **NetworkManager** and the graphical frontend used by the configuration.

```bash
sudo pacman -S networkmanager
```

Make sure the required services are enabled and running for network and hardware functionality.

> Package availability and package names can change. Check the Arch repositories if a package name differs on your system.

## 🛠️ Customization

### Hyprland

The main compositor configuration lives in:

```text
hypr/
```

This is where window management, keybindings, monitors, animations, workspaces, rules, and application launching are configured.

### Waybar

Waybar provides the desktop status bar.

It handles things such as:

* Workspaces
* Network
* Audio
* Battery
* System status
* Quick-access controls

### Ghostty

The Ghostty configuration controls the terminal's:

* Typography
* Colors
* Padding
* Appearance
* Behavior

### Mako

Mako controls desktop notifications, including their:

* Appearance
* Position
* Timeout
* Urgency behavior

### wlogout

wlogout provides the graphical session and power interface.

### GTK

The GTK configuration keeps GTK applications visually consistent with the rest of the desktop.

### Helix and Geany

Both editors provide lightweight development workflows:

* **Helix** for terminal-first editing
* **Geany** for graphical editing

## 🧩 Small Tools, Big Workflow

A minimalist desktop doesn't mean having no utilities.

It means using **small, dedicated tools instead of one giant desktop stack**.

* **Waybar** provides the desktop status interface.
* **nmgui** provides convenient graphical network management.
* **Blueman** handles Bluetooth.
* **brightnessctl** provides simple hardware brightness control.
* **Zenity** allows shell scripts and utilities to display graphical dialogs.

Each tool fills a specific gap without requiring an entire desktop environment.

## 🔄 Evolving Setup

This repository is intentionally a work in progress.

The configuration changes as my workflow changes.

Applications may be replaced, styling may be redesigned, and parts of the configuration may be reorganized.

That's normal for dotfiles.

They're not a finished product — they're a record of how I currently use Linux.

## 📜 Philosophy

```text
        ┌──────────────┐
        │   Hyprland   │
        └──────┬───────┘
               │
     ┌─────────┼─────────┐
     │         │         │
  Waybar    Ghostty    Mako
     │         │         │
     └─────────┼─────────┘
               │
       Small focused tools
               │
        ┌──────┴──────┐
        │   Desktop   │
        └─────────────┘
```

No enormous framework is required to make a great Linux desktop.

Just a compositor, a few good applications, sensible configuration, and enough tweaking until everything feels right.

## 👤 Author

**Swastik Chatterjee**

Linux enthusiast · developer · desktop customization enjoyer
