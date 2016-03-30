
#!/bin/bash

# color codes
red='tput setaf 1'
green="tput setaf 2"
yellow="tput setaf 3"
blue="tput setaf 4"
purple="tput setaf 5"
cyan="tput setaf 6"
white='tput setaf 7'
orange="tput setaf 9"
gray="tput setaf 10"
# color codes

echo ""
echo "$(tput setaf 7)--------------------------------------------------"
echo "$(tput setaf 9) Nautilus Python Installer Script for Non-Root"
echo "$(tput setaf 7)--------------------------------------------------"
echo ""
nautilus_python_dir="$HOME/.local/share/nautilus-python/extensions"
if [ ! -d $nautilus_python_dir ]; then
	echo "$(tput setaf 7)-----------------------------------------------------------------"
	echo "$(tput setaf 6) Nautilus-python directory not exist, creating directory for nautilus-python"
	echo "$(tput setaf 7)-----------------------------------------------------------------"	
	echo ""
	mkdir -p $HOME/.local/share/nautilus-python/extensions
	echo ""
	echo "$(tput setaf 7)---------------------------------------------"
	echo "$(tput setaf 3)Nautilus Python Extensions Directory Created"
	echo "$(tput setaf 7)---------------------------------------------"
	echo ""
fi


MD5_FILE="$HOME/.local/share/nautilus-python/extensions/md5sum.py"
if [ -f $MD5_FILE ]; then
	echo "$(tput setaf 7)---------------------------"
	echo "$(tput setaf 2)Md5sum.py already installed"
	echo "$(tput setaf 1) Nothing need to be done"
	echo "$(tput setaf 7)---------------------------"
else
	echo ""
	echo "$(tput setaf 7)-----------------------------------------------------------------"
	echo "$(tput setaf 4)Copying extensions into the Nautilus Python Extensions directory"
	echo "$(tput setaf 7)-----------------------------------------------------------------"
	echo ""
	cp md5sum.py $HOME/.local/share/nautilus-python/extensions
	echo ""
	echo "$(tput setaf 7)----------------------------"
	echo "$(tput setaf 2)Installing has completed"
	echo "$(tput setaf 7)----------------------------"
	echo ""
	echo "$(tput setaf 7)----------------------------"
	echo "$(tput setaf 1) Please save your work and quit from nautilus completely "
	echo "$(tput setaf 1) Your nautilus in order to activate extensions command is ;"
	echo "$(tput setaf 2) Command is >> nautilus -q "
	echo "$(tput setaf 7) ----------------------------"
fi
