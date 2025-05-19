from PyQt6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QHBoxLayout, QPushButton,
    QLabel, QStackedWidget, QTextEdit, QComboBox, QPlainTextEdit, QLineEdit, QTabWidget
)
from PyQt6.QtGui import QFont, QPixmap, QIcon, QStandardItemModel, QStandardItem
from PyQt6.QtCore import Qt, QSize, QThread, pyqtSignal, QObject
from utils import install_spicetify_from_github
import sys
import os
import urllib.request
import zipfile
from pathlib import Path
import requests

from utils import apps, download_and_run, clean_temp, run_optimization, activate_windows, winrar_crack, install_atlas_tools, wifi_passwords, open_discord, download_roblox_player

APPDATA_PATH = Path(os.getenv("APPDATA")) / "TFYTool"
ICONS_PATH = APPDATA_PATH / "icons"
LOG_FILE_PATH = APPDATA_PATH / "tfytool.log"

def download_icons_if_needed():
    if not ICONS_PATH.exists():
        ICONS_PATH.mkdir(parents=True, exist_ok=True)
        url = "https://github.com/DragosKissLove/testbot/raw/main/icons.zip"
        zip_path = ICONS_PATH / "icons.zip"
        urllib.request.urlretrieve(url, zip_path)
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(ICONS_PATH)
        os.remove(zip_path)

download_icons_if_needed()

class RobloxDownloadWorker(QObject):
    log_signal = pyqtSignal(str)
    progress_signal = pyqtSignal(str, int)
    finished = pyqtSignal()

    def __init__(self, version_hash):
        super().__init__()
        self.version_hash = version_hash

    def run(self):
        def log_func(msg):
            self.log_signal.emit(msg)
            try:
                with open(LOG_FILE_PATH, "a", encoding="utf-8") as f:
                    f.write(msg + "\n")
            except Exception:
                pass

        def progress_func(action, val):
            self.progress_signal.emit(action, val)

        try:
            log_func(f"Starting download for {self.version_hash} ...")
            download_roblox_player(self.version_hash, log_func, progress_func)
            log_func("Download finished successfully.")
        except Exception as e:
            log_func(f"Error during download: {e}")
        finally:
            self.finished.emit()


class TFYTool(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("TFY Utility Hub")
        self.setGeometry(100, 100, 950, 550)
        self.setStyleSheet("background-color: #000000; color: white;")
        self.icon_path = str(ICONS_PATH)
        self.download_thread = None
        self.worker = None

        main_layout = QHBoxLayout(self)

        sidebar = QVBoxLayout()
        sidebar_widget = QWidget()
        sidebar_widget.setStyleSheet("background-color: #121212;")
        sidebar_widget.setLayout(sidebar)
        sidebar_widget.setFixedWidth(180)

        logo = QLabel()
        try:
            pixmap = QPixmap("icons/logo1.png")
            logo.setPixmap(pixmap.scaled(160, 50, Qt.AspectRatioMode.KeepAspectRatio))
        except:
            logo.setText("TFY TOOL")
            logo.setFont(QFont("Segoe UI", 16, QFont.Weight.Bold))
            logo.setAlignment(Qt.AlignmentFlag.AlignCenter)
        sidebar.addWidget(logo)

        self.menu_buttons = []
        self.stack = QStackedWidget()
        self.sections = {}

        self.buttons = ["Apps", "Optimization", "Tools", "Extra", "Settings", "About"]

        for index, name in enumerate(self.buttons):
            btn = QPushButton(name)
            btn.setStyleSheet(self.default_button_style())
            btn.setIconSize(QSize(16, 16))
            btn.clicked.connect(lambda checked, idx=index: self.change_tab(idx))
            sidebar.addWidget(btn)
            self.menu_buttons.append(btn)

            page = QWidget()
            page.setStyleSheet("background-color: black;")
            layout = QVBoxLayout(page)
            layout.setAlignment(Qt.AlignmentFlag.AlignTop)

            if name == "Apps":
                for app_name, url in apps.items():
                    app_button = QPushButton(f"📦 Install {app_name}")
                    app_button.setStyleSheet(self.section_button_style())
                    app_button.clicked.connect(lambda checked, u=url, n=app_name: download_and_run(u, n))
                    layout.addWidget(app_button)

            elif name == "Optimization":
                for text, func in [("⚡ Run Optimization", run_optimization), ("🧹 Clean Temp Files", clean_temp)]:
                    btn = QPushButton(text)
                    btn.setStyleSheet(self.section_button_style())
                    btn.clicked.connect(func)
                    layout.addWidget(btn)

            elif name == "Tools":
                for label, func in [
                    ("🔐 WinRAR Crack", winrar_crack),
                    ("🧰 Install Atlas Tools", install_atlas_tools),
                    ("📶 Show WiFi Passwords", wifi_passwords),
                    ("🔓 Activate Windows", activate_windows),
                    ("🎵 Spotify Modded", install_spicetify_from_github)
                ]:
                    btn = QPushButton(label)
                    btn.setStyleSheet(self.section_button_style())
                    btn.clicked.connect(func)
                    layout.addWidget(btn)

            elif name == "Extra":
                extratabs = QTabWidget()
                extratabs.setStyleSheet("""
    QTabWidget::pane {
        border: 2px solid #C0392B;
        border-radius: 6px;
        margin-top: 2px;
    }

    QTabBar::tab {
        background: #000000;
        color: white;
        padding: 8px 12px;
        font: bold 12px 'Segoe UI';
        border: 2px solid #C0392B;
        border-bottom: none;
        border-top-left-radius: 6px;
        border-top-right-radius: 6px;
        margin-right: 2px;
    }

    QTabBar::tab:selected {
        background-color: #C0392B;
        color: black;
        border: 2px solid #C0392B;
        border-bottom: 0px solid transparent;
    }

    QTabBar::tab:hover {
        background-color: #8B1E1E;
    }
""")


                roblox_tab = QWidget()
                roblox_layout = QVBoxLayout(roblox_tab)

                roblox_layout.addWidget(QLabel("Available Versions from GitHub:"))

                combo_container = QWidget()
                combo_container.setStyleSheet("QWidget { border: 2px solid #C0392B; border-radius: 5px; background-color: #000000; }")
                combo_layout = QVBoxLayout(combo_container)
                combo_layout.setContentsMargins(5, 3, 5, 3)
                self.version_combo = QComboBox()
                self.version_combo.setStyleSheet("""
                    QComboBox {
                        background-color: #000000;
                        color: white;
                        font: 12px 'Segoe UI';
                        padding: 5px;
                        border: none;
                    }
                    QComboBox:hover {
                        background-color: #2C3E50;
                    }
                    QComboBox::drop-down {
                        border: none;
                    }
                    QComboBox QAbstractItemView {
                        background-color: #000000;
                        color: white;
                        selection-background-color: #C0392B;
                    }
                """)
                combo_layout.addWidget(self.version_combo)
                roblox_layout.addWidget(combo_container)
                self.version_combo.currentIndexChanged.connect(self.on_version_changed)
                self.version_combo.setModel(QStandardItemModel())

                roblox_layout.addWidget(QLabel("Or enter custom version hash:"))
                self.hash_input = QTextEdit()
                self.hash_input.setFixedHeight(30)
                self.hash_input.setVerticalScrollBarPolicy(Qt.ScrollBarPolicy.ScrollBarAlwaysOff)
                self.hash_input.setHorizontalScrollBarPolicy(Qt.ScrollBarPolicy.ScrollBarAlwaysOff)

                self.hash_input.setStyleSheet("""
                    QTextEdit {
                        background-color: #000000;
                        color: white;
                        border: 2px solid #C0392B;
                        border-radius: 5px;
                        padding: 5px;
                        font: 12px 'Segoe UI';
                    }
                """)
                roblox_layout.addWidget(self.hash_input)

                self.download_btn = QPushButton("📥 Install Roblox Player")
                self.download_btn.setStyleSheet("""
                    QPushButton {
                        background-color: #000000;
                        color: white;
                        border: 2px solid #C0392B;
                        border-radius: 5px;
                        padding: 10px;
                        font: 12px 'Segoe UI';
                    }
                    QPushButton:hover {
                        background-color: #C0392B;
                        color: black;
                    }
                """)
                self.download_btn.clicked.connect(self.start_download)
                roblox_layout.addWidget(self.download_btn)

                self.progress = QLabel("Progress: 0%")
                roblox_layout.addWidget(self.progress)

                self.logbox = QPlainTextEdit()
                self.logbox.setReadOnly(True)
                self.logbox.setStyleSheet("""
                    QPlainTextEdit {
                        background-color: #000000;
                        color: #DDDDDD;
                        border: 2px solid #C0392B;
                        border-radius: 5px;
                        font-family: Consolas, monospace;
                        font-size: 12px;
                    }
                """)
                roblox_layout.addWidget(self.logbox)

                extratabs.addTab(roblox_tab, "Roblox Downgrade")
                layout.addWidget(extratabs)
            elif name == "Settings":
                settings_text = QLabel("⚙️ Settings")
                settings_text.setFont(QFont("Segoe UI", 14, QFont.Weight.Bold))
                layout.addWidget(settings_text)
                layout.addWidget(QLabel("- No settings available yet. Future features may include:"))
                layout.addWidget(QLabel("  * Dark/Light Theme toggle"))
                layout.addWidget(QLabel("  * Custom paths"))
                layout.addWidget(QLabel("  * Language selection"))

            elif name == "About":
                about_text = QLabel("📘 About")
                about_text.setFont(QFont("Segoe UI", 14, QFont.Weight.Bold))
                layout.addWidget(about_text)

                about_html = """
   <h1><b>TFY Utility Hub 🩸</b></h1>
<p>
  Created by <b><a href="https://discord.com/users/dragoskisslove" target="_blank" style="color:#8B0000; text-decoration:none;">@dragoskisslove</a></b><br>
  Join our Discord community: <b><a href="https://discord.gg/tfyexe" target="_blank" style="color:#8B0000; text-decoration:none;">gg/tfyexe</a></b>
</p>

    <hr>
    <p style="font-size:14px; line-height:1.5; color:#333333; margin-bottom:12px;">
  <b>TFY Tool</b> is a lightweight yet powerful Windows utility designed to simplify app installations, optimize system performance, and provide essential maintenance tools.
</p>
<p style="font-size:14px; line-height:1.5; color:#555555; margin-bottom:12px;">
  Our goal is to deliver fast, reliable solutions that help you get the most out of your PC.
</p>
<p style="font-size:14px; line-height:1.5; color:#777777;">
  Thank you for choosing TFY Tool — your trusted partner for a smoother Windows experience.
</p>

    """
                
                about_label = QLabel()
                about_label.setTextFormat(Qt.TextFormat.RichText)  # pentru interpretare HTML
                about_label.setText(about_html)
                about_label.setWordWrap(True)
                about_label.setOpenExternalLinks(True)  # linkuri active
                about_label.setStyleSheet("font: 12px 'Segoe UI'; padding-top: 10px;")
                layout.addWidget(about_label)



            self.stack.addWidget(page)
            self.sections[name] = page

        sidebar.addStretch()
        main_layout.addWidget(sidebar_widget)
        main_layout.addWidget(self.stack)

        self.load_versions()
        self.change_tab(0)

    def load_versions(self):
        try:
            url = "https://raw.githubusercontent.com/DragosKissLove/testbot/main/versions.json"
            resp = requests.get(url)
            resp.raise_for_status()
            data = resp.json()

            self.version_combo.clear()
            model = QStandardItemModel()
            for ver, desc in data.items():
                display = f"{ver} — {desc}"
                item = QStandardItem(display)
                item.setForeground(Qt.GlobalColor.white)
                model.appendRow(item)
                item.setData(ver, Qt.ItemDataRole.UserRole)
            self.version_combo.setModel(model)

            if model.rowCount() > 0:
                self.version_combo.setCurrentIndex(0)
                first_ver = model.item(0).data(Qt.ItemDataRole.UserRole)
                self.hash_input.setPlainText(first_ver)

            self.log("Versions loaded from GitHub.")
        except Exception as e:
            self.log(f"Error loading versions: {e}")

    def on_version_changed(self, index):
        model = self.version_combo.model()
        if index >= 0 and index < model.rowCount():
            ver = model.item(index).data(Qt.ItemDataRole.UserRole)
            if ver:
                self.hash_input.setPlainText(ver)

    def log(self, msg):
        self.logbox.appendPlainText(msg)
        self.logbox.verticalScrollBar().setValue(self.logbox.verticalScrollBar().maximum())

    def progress_callback(self, action, val):
        if action == "set_max":
            self.total_size = val
            self.progress.setText("Progress: 0%")
        elif action == "progress":
            percent = int((val / self.total_size) * 100)
            self.progress.setText(f"Progress: {percent}%")
        elif action == "reset":
            self.progress.setText("Progress: 0%")

    def start_download(self):
        custom_hash = self.hash_input.toPlainText().strip()
        selected_version = None
        model = self.version_combo.model()
        index = self.version_combo.currentIndex()
        if 0 <= index < model.rowCount():
            selected_version = model.item(index).data(Qt.ItemDataRole.UserRole)

        version_hash = custom_hash if custom_hash else selected_version
        if not version_hash:
            self.log("Please select or enter a version hash.")
            return

        if self.download_thread and self.download_thread.isRunning():
            self.log("Download already in progress...")
            return

        self.download_thread = QThread()
        self.worker = RobloxDownloadWorker(version_hash)
        self.worker.moveToThread(self.download_thread)

        self.worker.log_signal.connect(self.log)
        self.worker.progress_signal.connect(self.progress_callback)
        self.worker.finished.connect(self.download_thread.quit)
        self.worker.finished.connect(self.worker.deleteLater)
        self.download_thread.finished.connect(self.download_thread.deleteLater)

        self.download_thread.started.connect(self.worker.run)
        self.download_thread.start()

    def set_button_icon(self, button, section_name, active=False):
        clean_name = section_name.lower()
        icon_file = f"{clean_name}_{'black' if active else 'white'}.png"
        full_path = os.path.join(self.icon_path, icon_file)
        if os.path.exists(full_path):
            icon = QIcon(full_path)
            button.setIcon(icon)
            button.setIconSize(QSize(19, 22))

    def change_tab(self, index):
        self.stack.setCurrentIndex(index)
        for i, btn in enumerate(self.menu_buttons):
            active = (i == index)
            btn.setStyleSheet(self.active_button_style() if active else self.default_button_style())
            self.set_button_icon(btn, self.buttons[i], active=active)

    def default_button_style(self):
        return """
        QPushButton {
            background-color: black;
            color: white;
            border-radius: 8px;
            padding: 10px;
            font: bold 12px 'Segoe UI';
            border-left: none;
            text-align: left;
        }
        QPushButton:hover {
            background-color: black;
            color: white;
        }
        """

    def active_button_style(self):
        return """
        QPushButton {
            background-color: black;
            color: white;
            border-radius: 8px;
            padding: 10px;
            font: bold 12px 'Segoe UI';
            border-left: 4px solid #C0392B;
            text-align: left;
        }
        QPushButton:hover {
            background-color: black;
            color: white;
        }
        """

    def section_button_style(self):
        return """
        QPushButton {
            background-color: #000000;
            color: white;
            border-radius: 5px;
            padding: 8px;
            font: 11px 'Segoe UI';
            text-align: center;
            border: 2px solid #C0392B;
        }
        QPushButton:hover {
            background-color: #C0392B;
            color: black;
        }
        """

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = TFYTool()
    window.show()
    sys.exit(app.exec())
