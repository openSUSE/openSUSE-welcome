#!/usr/bin/python3

import argparse
import gi
import sys

sys.path.append('/usr/share/xfce4-panel-profiles/xfce4-panel-profiles/')
from gi.repository import Gio
from panelconfig import PanelConfig

parser = argparse.ArgumentParser(
        description="Applies a new XFCE desktop layout")
parser.add_argument("layout", help="Path to a XFCE panel layout bzip2 file in from <prefix>/share/xfce4-panel-profiles/layouts")

args = parser.parse_args()

session_bus = Gio.BusType.SESSION
cancellable = None
connection = Gio.bus_get_sync(session_bus, cancellable)

proxy_property = 0
interface_properties_array = None
destination = 'org.xfce.Xfconf'
path = '/org/xfce/Xfconf'
interface = destination

xfconf = Gio.DBusProxy.new_sync(
    connection,
    proxy_property,
    interface_properties_array,
    destination,
    path,
    interface,
    cancellable)

PanelConfig.from_file(args.layout).to_xfconf(xfconf)
