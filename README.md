# XFCE-GenMon-Now-Playing
Simple plugin that allows you to present playing music info in flat text mode and switch pause/play.

<img width="1001" height="135" alt="imagen" src="https://github.com/user-attachments/assets/bd92e27f-f47d-418d-82dd-b01d44742b45" />

## Features

- Shows the title of the song, the artist, the album, the length of the track, the time elapsed and a progress bar.
- By clicking on the plugin, reproduction is paused or continues.
- I created this script out of necessity and curiosity, since for now there is no XFCE plugin for this (unlike KDE and Gnome). It is a very simple piece of code that can help you as an example to work with playerctl, bash and GenMon.

## Limitations

- It works only with media players that implement the MPRIS D-Bus interface. Virtually everyone does, or can be configured for it.
- The host panel must be horizontal.
- Ok, it's really not very fancy. I you know Qt, maybe you could create that beautiful plugin that we all want.

## Requirements

- XFCE environment.
- [playerctl](https://github.com/altdesktop/playerctl). Probably it's already installed in your system, if not, `sudo apt install playerctl`.
- [xfce4-genmon-plugin](https://docs.xfce.org/panel-plugins/xfce4-genmon-plugin/start) (`sudo apt install xfce4-genmon-plugin`).
- Playerctl's demon must be working on background. To do this, add the command `playerctld daemon` to the list of processes that run automatically on login.

## Installation

- Download the `xfce4-genmon-now-playing.sh` file, save it anywhere and give execution permission. 
- Add a new Generic Monitor item to your XFCE Panel and configure it:
    1. **Command**: Browse and select the script previously downloaded.
    2. **Label**: Unchecked
    3. **Period (s)**: 1.00
    4. **Font**: Select a **monospaced** font, this is important. I use Noto Sans Mono 9.

