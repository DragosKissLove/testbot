import os
import subprocess
import urllib.request
import requests
import zipfile
import tempfile
import webbrowser
from tkinter import messagebox
import yt_dlp

apps = {
    "Discord": "https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9014/DiscordSetup.exe",
    "Steam": "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe",
    "Epic Games": "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi",
    "Brave Browser": "https://laptop-updates.brave.com/latest/winx64",
    "Faceit AC": "https://cdn.faceit.com/faceit/anticheat/FaceitAC_1.0.17.36.exe",
    "Spotify": "https://download.scdn.co/SpotifySetup.exe",
    "WinRAR": "https://www.rarlab.com/rar/winrar-x64-621.exe",
    "Malwarebytes": "https://data-cdn.mbamupdates.com/web/mb4-setup-consumer/offline/MBSetup.exe",
    "VLC Player": "https://get.videolan.org/vlc/3.0.20/win64/vlc-3.0.20-win64.exe",
    "qBittorrent": "https://sourceforge.net/projects/qbittorrent/files/latest/download"
}

def download_and_run(url, name):
    try:
        path = os.path.join(tempfile.gettempdir(), f"{name}.exe")
        urllib.request.urlretrieve(url, path)
        subprocess.Popen(path, shell=True)
    except Exception as e:
        messagebox.showerror("Download Error", str(e))

def clean_temp():
    try:
        os.system("del /s /f /q %temp%\*")
        os.system("del /s /f /q C:\Windows\Temp\*")
        messagebox.showinfo("Temp Cleaner", "Temporary files cleaned!")
    except Exception as e:
        messagebox.showerror("Temp Cleaner Error", str(e))

def run_optimization():
    try:
        url = "https://raw.githubusercontent.com/DragosKissLove/testbot/main/TFY%20Optimization.bat"
        path = os.path.join(tempfile.gettempdir(), "TFY_Optimization.bat")
        urllib.request.urlretrieve(url, path)
        subprocess.run(["powershell", "-Command", f'Start-Process "{path}" -Verb RunAs'], shell=True)
    except Exception as e:
        messagebox.showerror("Optimization Error", str(e))

def activate_windows():
    try:
        os.system('powershell -Command "irm https://get.activated.win | iex"')
        messagebox.showinfo("Activation", "Activation process started.")
    except Exception as e:
        messagebox.showerror("Activation Error", str(e))

def winrar_crack():
    try:
        url = "https://github.com/jtlw99/crack-winrar/releases/download/v1/rarreg.key"
        r = requests.get(url)
        for path in ["C:\Program Files\WinRAR\rarreg.key", "C:\Program Files (x86)\WinRAR\rarreg.key"]:
            try:
                with open(path, "wb") as f:
                    f.write(r.content)
                messagebox.showinfo("Success", f"Crack applied in {path}")
                return
            except:
                continue
        messagebox.showwarning("Warning", "No valid WinRAR path found.")
    except Exception as e:
        messagebox.showerror("Error", str(e))

def install_atlas_tools():
    try:
        download_folder = os.path.join(os.path.expanduser("~"), "Downloads")
        os.makedirs(download_folder, exist_ok=True)
        atlas_url = "https://github.com/Atlas-OS/Atlas/releases/download/0.4.1/AtlasPlaybook_v0.4.1.apbx"
        ame_url = "https://download.ameliorated.io/AME%20Wizard%20Beta.zip"
        atlas_path = os.path.join(download_folder, "AtlasPlaybook_v0.4.1.apbx")
        ame_zip = os.path.join(download_folder, "AME_Wizard_Beta.zip")
        ame_extract = os.path.join(download_folder, "AME_Wizard_Beta")
        urllib.request.urlretrieve(atlas_url, atlas_path)
        urllib.request.urlretrieve(ame_url, ame_zip)
        with zipfile.ZipFile(ame_zip, 'r') as zip_ref:
            zip_ref.extractall(ame_extract)
        for root, _, files in os.walk(ame_extract):
            for file in files:
                if file.endswith(".exe"):
                    os.startfile(os.path.join(root, file))
                    return
        messagebox.showerror("Error", "No executable found.")
    except Exception as e:
        messagebox.showerror("Atlas OS Tools Error", str(e))

def youtube_downloader():
    import tkinter.simpledialog as sd
    try:
        url = sd.askstring("YouTube", "Enter YouTube URL:")
        if not url: return
        ydl_opts = {
            'format': 'bestaudio/best',
            'outtmpl': os.path.expanduser('~/Downloads/%(title)s.%(ext)s'),
            'postprocessors': [{
                'key': 'FFmpegExtractAudio',
                'preferredcodec': 'mp3',
                'preferredquality': '192',
            }],
        }
        with yt_dlp.YoutubeDL(ydl_opts) as ydl:
            ydl.download([url])
        messagebox.showinfo("Success", "Download complete.")
    except Exception as e:
        messagebox.showerror("Error", str(e))

def wifi_passwords():
    try:
        result = subprocess.check_output("netsh wlan show profiles", shell=True).decode()
        profiles = [line.split(":")[1].strip() for line in result.split("\n") if "All User Profile" in line]
        out = ""
        for profile in profiles:
            try:
                pw_result = subprocess.check_output(f'netsh wlan show profile name="{profile}" key=clear', shell=True).decode()
                for line in pw_result.split("\n"):
                    if "Key Content" in line:
                        password = line.split(":")[1].strip()
                        out += f"{profile}: {password}\n"
            except:
                continue
        if out:
            messagebox.showinfo("WiFi Passwords", out)
        else:
            messagebox.showinfo("WiFi Passwords", "No passwords found.")
    except Exception as e:
        messagebox.showerror("WiFi Error", str(e))

def open_discord():
    webbrowser.open("https://discord.gg/tfyexe")