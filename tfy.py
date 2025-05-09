import os
import requests
import time
import zipfile
import msvcrt
import sys
import webbrowser
from pystyle import Colors, Colorate, Center

# Consola setată la o dimensiune echilibrată
try:
    os.system("mode 135,40")
except:
    pass

apps = {
    "1": ("Discord", "https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9014/DiscordSetup.exe"),
    "2": ("Steam", "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"),
    "3": ("Epic Games", "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi"),
    "4": ("Brave Browser", "https://laptop-updates.brave.com/latest/winx64"),
    "5": ("Faceit AC", "https://cdn.faceit.com/faceit/anticheat/FaceitAC_1.0.17.36.exe"),
    "6": ("Spotify", "https://download.scdn.co/SpotifySetup.exe"),
    "7": ("WinRAR", "https://www.rarlab.com/rar/winrar-x64-621.exe"),
    "8": ("Malwarebytes", "https://data-cdn.mbamupdates.com/web/mb4-setup-consumer/offline/MBSetup.exe"),
    "9": ("VLC Player", "https://get.videolan.org/vlc/3.0.20/win64/vlc-3.0.20-win64.exe"),
    "10": ("qBittorrent", "https://sourceforge.net/projects/qbittorrent/files/latest/download")
}

def clear():
    os.system("cls" if os.name == "nt" else "clear")

def wait():
    print("\n\nPress any key to continue...")
    msvcrt.getch()
    clear()

def activate_windows():
    os.system("powershell -Command \"irm https://get.activated.win | iex\"")
    wait()

def support():
    webbrowser.open("https://discord.gg/xDN3eSyfqU")

def clean_temp():
    clear()
    print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("Cleaning temporary files...")))
    os.system("del /s /f /q %temp%\\*")
    os.system("del /s /f /q C:\\Windows\\Temp\\*")
    wait()

import urllib.parse

def windows_optimization():
    clear()
    print(Colorate.Horizontal(Colors.green_to_blue, Center.XCenter("Downloading and running TFY Optimization tool...")))

    try:
        encoded_filename = urllib.parse.quote("TFY Optimization.bat")
        bat_url = f"https://raw.githubusercontent.com/DragosKissLove/testbot/main/{encoded_filename}"
        temp_path = os.path.join(os.getenv("TEMP"), "TFY_Optimization.bat")

        response = requests.get(bat_url)
        response.raise_for_status()

        with open(temp_path, "wb") as f:
            f.write(response.content)

        # Rulează .bat ca administrator prin PowerShell
        powershell_cmd = f'Start-Process -FilePath "{temp_path}" -Verb RunAs -Wait'
        os.system(f'powershell -Command "{powershell_cmd}"')

    except Exception as e:
        print(Colorate.Horizontal(Colors.red_to_blue, Center.XCenter(f"ERROR: {e}")))

    wait()
    main_menu()



def winrar_crack():
    clear()
    print(Colorate.Horizontal(Colors.blue_to_red, Center.XCenter("Applying WinRAR Crack...")))
    url = "https://github.com/jtlw99/crack-winrar/releases/download/v1/rarreg.key"
    try:
        r = requests.get(url)
        paths = [
            "C:\\Program Files\\WinRAR\\rarreg.key",
            "C:\\Program Files (x86)\\WinRAR\\rarreg.key"
        ]
        for path in paths:
            try:
                with open(path, "wb") as f:
                    f.write(r.content)
                print(Colorate.Horizontal(Colors.blue_to_red, f"Crack applied in {path}"))
            except:
                continue
    except Exception as e:
        print(f"Eroare: {e}")
    wait()
    
import zipfile  # asigură-te că ai această importare

def install_atlas_tools():
    clear()
    print("\n" * 2)
    print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("╔════════════════════════════════════════════════════╗")))
    print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("║           Installing Atlas OS Tools...             ║")))
    print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("╚════════════════════════════════════════════════════╝")))
    print()

    try:
        download_folder = os.path.join(os.path.expanduser("~"), "Downloads")
        if not os.path.exists(download_folder):
            os.makedirs(download_folder)

        # Atlas Playbook
        atlas_url = "https://github.com/Atlas-OS/Atlas/releases/download/0.4.1/AtlasPlaybook_v0.4.1.apbx"
        atlas_path = os.path.join(download_folder, "AtlasPlaybook_v0.4.1.apbx")
        print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("[*] Downloading Atlas Playbook...")))
        response = requests.get(atlas_url)
        with open(atlas_path, "wb") as f:
            f.write(response.content)
        print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("[OK] Atlas Playbook downloaded.")))

        # AME Wizard
        ame_url = "https://download.ameliorated.io/AME%20Wizard%20Beta.zip"
        ame_zip_path = os.path.join(download_folder, "AME_Wizard_Beta.zip")
        ame_extract_path = os.path.join(download_folder, "AME_Wizard_Beta")
        print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("[*] Downloading AME Wizard...")))
        response = requests.get(ame_url)
        with open(ame_zip_path, "wb") as f:
            f.write(response.content)
        print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("[OK] AME Wizard downloaded.")))

        # Extract ZIP
        print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("[*] Extracting AME Wizard...")))
        with zipfile.ZipFile(ame_zip_path, 'r') as zip_ref:
            zip_ref.extractall(ame_extract_path)
        print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("[OK] AME Wizard extracted.")))

        # Search and run first .exe
        exe_found = False
        for root, dirs, files in os.walk(ame_extract_path):
            for file in files:
                if file.lower().endswith(".exe"):
                    exe_path = os.path.join(root, file)
                    print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter(f"[>>] Launching {file}...")))
                    os.startfile(exe_path)
                    exe_found = True
                    break
            if exe_found:
                break

        if not exe_found:
            print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("[X] ERROR: No .exe found in extracted folder.")))

        print()
        print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter("[!] Atlas OS Tools installation completed.")))
        wait()

    except Exception as e:
        print()
        print(Colorate.Horizontal(Colors.red_to_purple, Center.XCenter(f"[X] Eroare: {e}")))
        wait()




    

def install_apps():
    while True:
        clear()
        print(Colorate.Horizontal(Colors.cyan_to_blue, Center.XCenter("""
  ▄▄▄·  ▄▄▄· ▄▄▄·    ▪       .▄▄ · ▄▄▄▄▄ ▄▄▄· ▄▄▌  ▄▄▌  ▄▄▄ .▄▄▄  
 █ ▀█ ▐█ ▄█▐█ ▄█    ██  █▌▐█▐█ ▀. •██  ▐█ ▀█ ██•  ██•  ▀▄.▀·▀▄ █·
▄█▀▀█  ██▀· ██▀·    ▐█·▐█▐▐▌▄▀▀▀█▄ ▐█.▪▄█▀▀█ ██▪  ██▪  ▐▀▀▪▄▐▀▀▄
▐█ ▪▐▌▐█▪·•▐█▪·•    ▐█ ██▐█▌▐█▄▪▐█ ▐█▌·▐█ ▪▐▌▐█▌▐▌▐█▌▐▌▐█▄▄▌▐█•█▌
 ▀  ▀ .▀   .▀       ▀▀ ▀▀  ▪ ▀▀▀▀  ▀▀▀  ▀  ▀ .▀▀▀ .▀▀▀  ▀▀▀ .▀  ▀
 
        """)))
        for key, (name, _) in apps.items():
            print(Colorate.Horizontal(Colors.blue_to_cyan, Center.XCenter(f"[{key}] Install {name}")))
        print(Colorate.Horizontal(Colors.cyan_to_blue, Center.XCenter("[0] Back to main menu")))
        choice = msvcrt.getch().decode("utf-8")
        if choice == "0":
            break
        elif choice in apps:
            name, url = apps[choice]
            clear()
            print(Colorate.Horizontal(Colors.cyan_to_blue, Center.XCenter(f"Downloading {name}...")))
            response = requests.get(url)
            path = os.path.join(os.getenv("TEMP"), f"{name.replace(' ', '_')}.exe")
            with open(path, "wb") as f:
                f.write(response.content)
            os.startfile(path)
            print(Colorate.Horizontal(Colors.green_to_blue, Center.XCenter(f"{name} launched for install.")))
            wait()
        else:
            print("Invalid option!")
            wait()

def main_menu():
    while True:
        clear()
        print(Colorate.Horizontal(Colors.rainbow, Center.XCenter("""




▄▄▄█████▓  █████▒▓██   ██▓    ▒█████   ██▓███  ▄▄▄█████▓ ██▓ ███▄ ▄███▓ ██▓▒███████▒ ▄▄▄     ▄▄▄█████▓ ██▓ ▒█████   ███▄    █ 
▓  ██▒ ▓▒▓██   ▒  ▒██  ██▒   ▒██▒  ██▒▓██░  ██▒▓  ██▒ ▓▒▓██▒▓██▒▀█▀ ██▒▓██▒▒ ▒ ▒ ▄▀░▒████▄   ▓  ██▒ ▓▒▓██▒▒██▒  ██▒ ██ ▀█   █ 
▒ ▓██░ ▒░▒████ ░   ▒██ ██░   ▒██░  ██▒▓██░ ██▓▒▒ ▓██░ ▒░▒██▒▓██    ▓██░▒██▒░ ▒ ▄▀▒░ ▒██  ▀█▄ ▒ ▓██░ ▒░▒██▒▒██░  ██▒▓██  ▀█ ██▒
░ ▓██▓ ░ ░▓█▒  ░   ░ ▐██▓░   ▒██   ██░▒██▄█▓▒ ▒░ ▓██▓ ░ ░██░▒██    ▒██ ░██░  ▄▀▒   ░░██▄▄▄▄██░ ▓██▓ ░ ░██░▒██   ██░▓██▒  ▐▌██▒
  ▒██▒ ░ ░▒█░      ░ ██▒▓░   ░ ████▓▒░▒██▒ ░  ░  ▒██▒ ░ ░██░▒██▒   ░██▒░██░▒███████▒ ▓█   ▓██▒ ▒██▒ ░ ░██░░ ████▓▒░▒██░   ▓██░
  ▒ ░░    ▒ ░       ██▒▒▒    ░ ▒░▒░▒░ ▒▓▒░ ░  ░  ▒ ░░   ░▓  ░ ▒░   ░  ░░▓  ░▒▒ ▓░▒░▒ ▒▒   ▓▒█░ ▒ ░░   ░▓  ░ ▒░▒░▒░ ░ ▒░   ▒ ▒ 
    ░     ░       ▓██ ░▒░      ░ ▒ ▒░ ░▒ ░         ░     ▒ ░░  ░      ░ ▒ ░░░▒ ▒ ░ ▒  ▒   ▒▒ ░   ░     ▒ ░  ░ ▒ ▒░ ░ ░░   ░ ▒░
  ░       ░ ░     ▒ ▒ ░░     ░ ░ ░ ▒  ░░         ░       ▒ ░░      ░    ▒ ░░ ░ ░ ░ ░  ░   ▒    ░       ▒ ░░ ░ ░ ▒     ░   ░ ░ 
                  ░ ░            ░ ░                     ░         ░    ░    ░ ░          ░  ░         ░      ░ ░           ░ 
                  ░ ░                                                      ░                                                  





                           ╔════════════════════════════════════════════════════════════════════════╗
                           ║                             TFY MAIN MENU                              ║
                           ╠════════════════════════════════════════════════════════════════════════╣
                           ║  [1] Install Applications        │  [2] Activate Windows               ║
                           ║  [3] Support (Discord)           │  [4] Clean Temp                     ║
                           ║  [5] Windows Optimization        │  [6] WinRAR Crack                   ║
                           ║  [8] Install Atlas OS Tools      │  [0] Quit Tool                      ║
                           ╚════════════════════════════════════════════════════════════════════════╝
                                

""")))
        opt = msvcrt.getch().decode("utf-8").lower()
        if opt == "1":
            install_apps()
        elif opt == "2":
            activate_windows()
        elif opt == "3":
            support()
        elif opt == "4":
            clean_temp()
        elif opt == "5":
            windows_optimization()
        elif opt == "6":
            winrar_crack()
        elif opt == "8":
            install_atlas_tools()
        elif opt == "0":
            clear()
            print(Colorate.Horizontal(Colors.red_to_blue, Center.XCenter("╔════════════════════════════════════════════════════╗")))
            print(Colorate.Horizontal(Colors.red_to_blue, Center.XCenter("║             Thank you for using TFY Tool!          ║")))
            print(Colorate.Horizontal(Colors.red_to_blue, Center.XCenter("║            Stay optimized. Stay in control...      ║")))
            print(Colorate.Horizontal(Colors.red_to_blue, Center.XCenter("╚════════════════════════════════════════════════════╝")))
            time.sleep(1)
            sys.exit()
        else:
            print(Colorate.Horizontal(Colors.red_to_blue, Center.XCenter("Invalid option! Try again.")))
            time.sleep(1)


if __name__ == '__main__':
    main_menu()

