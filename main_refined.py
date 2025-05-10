import customtkinter as ctk
from utils import *
from PIL import Image, ImageTk
import os

ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("green")

# Colors
DARK_TEAL = "#346053"
BLACK = "#000000"

# Init window
app = ctk.CTk()
app.geometry("950x550")
app.title("TFY Tool v3 – Refined Edition")
app.configure(bg=BLACK)

# Ensure working directory
os.chdir(os.path.dirname(os.path.abspath(__file__)))

# Sidebar
sidebar = ctk.CTkFrame(app, width=220, corner_radius=0, fg_color=BLACK)
sidebar.pack(side="left", fill="y")

# Load and display compact circular logo
img = Image.open("logo.png").resize((80, 80))
img = img.convert("RGBA")
mask = Image.new("L", img.size, 0)
Image.new("L", img.size, 255).save("mask.png")  # fallback if mask fails

logo_image = ctk.CTkImage(light_image=img, dark_image=img, size=(80, 80))
ctk.CTkLabel(sidebar, image=logo_image, text="").pack(pady=(25, 10))

# Style buttons
button_style = {
    "fg_color": DARK_TEAL,
    "hover_color": "#2a4c43",
    "text_color": "white",
    "corner_radius": 10,
    "font": ctk.CTkFont(size=13, weight="bold")
}

# Main content
main_frame = ctk.CTkFrame(app, fg_color=BLACK)
main_frame.pack(side="left", fill="both", expand=True)

frames = {
    "Apps": ctk.CTkFrame(main_frame, fg_color=BLACK),
    "Optimization": ctk.CTkFrame(main_frame, fg_color=BLACK),
    "Tools": ctk.CTkFrame(main_frame, fg_color=BLACK),
    "Extra": ctk.CTkFrame(main_frame, fg_color=BLACK),
    "About": ctk.CTkFrame(main_frame, fg_color=BLACK),
}
current_frame = [None]

def switch_tab(tab):
    if current_frame[0]:
        current_frame[0].pack_forget()
    frames[tab].pack(fill="both", expand=True)
    current_frame[0] = frames[tab]

buttons = {
    "Apps": lambda: switch_tab("Apps"),
    "Optimizations": lambda: switch_tab("Optimization"),
    "Tools": lambda: switch_tab("Tools"),
    "Extras": lambda: switch_tab("Extra"),
    "About": lambda: switch_tab("About")
}

for name, cmd in buttons.items():
    ctk.CTkButton(sidebar, text=name, command=cmd, **button_style).pack(pady=8, fill="x", padx=12)

# === APPS TAB ===
ctk.CTkLabel(frames["Apps"], text="Install Popular Applications", font=ctk.CTkFont(size=16, weight="bold")).pack(pady=10)
for name, url in apps.items():
    ctk.CTkButton(frames["Apps"], text=f"Install {name}", command=lambda url=url, name=name: download_and_run(url, name), **button_style).pack(pady=3)

# === OPTIMIZATION TAB ===
ctk.CTkButton(frames["Optimization"], text="Run TFY Windows Optimization", command=run_optimization, **button_style).pack(pady=10)
ctk.CTkButton(frames["Optimization"], text="Clean Temp Files", command=clean_temp, **button_style).pack(pady=10)

# === TOOLS TAB ===
ctk.CTkButton(frames["Tools"], text="Activate Windows", command=activate_windows, **button_style).pack(pady=10)
ctk.CTkButton(frames["Tools"], text="Apply WinRAR Crack", command=winrar_crack, **button_style).pack(pady=10)
ctk.CTkButton(frames["Tools"], text="Install Atlas OS Tools", command=install_atlas_tools, **button_style).pack(pady=10)

# === EXTRA TAB ===
ctk.CTkButton(frames["Extra"], text="Download YouTube Audio (MP3)", command=youtube_downloader, **button_style).pack(pady=10)
ctk.CTkButton(frames["Extra"], text="View Saved WiFi Passwords", command=wifi_passwords, **button_style).pack(pady=10)
ctk.CTkButton(frames["Extra"], text="Join Discord Support", command=open_discord, **button_style).pack(pady=10)

# === ABOUT TAB ===
about_text = (
    "TFY Tool v3 – Refined Edition\n\n"
    "✔ Crafted for modern Windows users\n"
    "✔ Developed by @dragoskisslove\n"
    "✔ Join: discord.gg/tfyexe\n\n"
    "Performance. Automation. Full Control.\n"
    "Stay optimized. Stay TFY."
)
ctk.CTkLabel(frames["About"], text=about_text, justify="left", font=ctk.CTkFont(size=14)).pack(padx=20, pady=40)

switch_tab("Apps")
app.mainloop()