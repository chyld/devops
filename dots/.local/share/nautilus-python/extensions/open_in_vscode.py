# DEBUGGING
# ---------
# print("hello", flush=True)
# journalctl -f
# nautilus -q && nautilus

import subprocess
from gi.repository import Nautilus, GObject, Gio

class VSCodeExtension(GObject.GObject, Nautilus.MenuProvider):
    def get_background_items(self, folder):
        # this runs when you browse to a different folder
        item = Nautilus.MenuItem(
            name="VSCodeExtension::open_in_vscode",
            label="Open in VS Code"
        )
        item.connect('activate', self._on_item_clicked, folder)
        return [item]
    
    def _on_item_clicked(self, menu_item, *args):
        # this runs when you click on the menu item
        folder_uri = args[0].get_uri()
        folder_path = folder_uri.replace("file://", "")
        subprocess.Popen(['code', folder_path])
