#!/bin/sh
# Set black background
xsetroot -solid "#222233" &

# Launch a friendly welcome xterm terminal
xterm -geometry 80x24+50+50 -title "Welcome to Custom Buildroot OS" -e sh -c '
echo "========================================================="
echo "   WELCOME TO YOUR CUSTOM BUILDROOT RETRO OS!           "
echo "========================================================="
echo " * Kernel:     $(uname -r)"
echo " * Libc:       glibc (GNU C Library)"
echo " * Window Mgr: Fluxbox (lightweight retro desktop)"
echo " * Package Mgr: opkg"
echo ""
echo " -> Right-click the desktop background to open the menu."
echo " -> Select \"Chocolate Doom\" to play Doom immediately!"
echo "========================================================="
sh
' &

# Start window manager (keeps session alive)
exec fluxbox
