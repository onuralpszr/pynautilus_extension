import os
import urllib
import gettext
gettext.textdomain("md5sum")
_ = gettext.gettext
import gi
gi.require_version("Gtk", "3.0")
gi.require_version("Nautilus", "3.0")
from gi.repository import Nautilus, GObject, Gio, Gtk
def alert(msg):
    dialog = Gtk.MessageDialog(buttons=Gtk.ButtonsType.OK,
        type=Gtk.MessageType.WARNING)
    dialog.set_markup(msg)
    response_id = dialog.run()
    if response_id == Gtk.ResponseType.OK:
        dialog.destroy()
    return
class OpenMd5sumExtension(GObject.GObject, Nautilus.MenuProvider):
    def _open_terminal(self, file):
        gfile = Gio.File.new_for_uri(file.get_uri())
        filename = gfile.get_path();
       ls
        md5_checker = os.popen("md5sum %s" % (filename)).readline()

        alert(str(md5_checker))
    def menu_activate_cb(self, menu, file):
        self._open_terminal(file)
    def menu_background_activate_cb(self, menu, file): 
        self._open_terminal(file)
    def get_file_items(self, window, files):
        if len(files) != 1:
            return
        file = files[0]
        if file.is_directory() or file.get_uri_scheme() != 'file':
            return
        item = Nautilus.MenuItem(name='NautilusPython::openterminal_file_item',
                                 label=_('Check Md5sum...'),
                                 tip=_('Check Md5sum for %s') % file.get_name())
        item.connect('activate', self.menu_activate_cb, file)
        return item,
    def get_background_items(self, window, file):
        item = Nautilus.MenuItem(name='NautilusPython::openterminal_item',
                                 label=_('Check Md5sum Here...'),
                                 tip=_('Check Md5sum for File'))
        item.connect('activate', self.menu_background_activate_cb, file)
        return item,