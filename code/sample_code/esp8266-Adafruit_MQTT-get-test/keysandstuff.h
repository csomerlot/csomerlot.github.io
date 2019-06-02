/************************* WiFI Setup *****************************/
// WiFi parameters
#define WLAN_SSID       "linksys"
#define WLAN_PASS       ""

/************************* Adafruit.io Setup *********************************/

#define AIO_SERVER      "io.adafruit.com"  //static
#define AIO_SERVERPORT  1883               //static
#define AIO_USERNAME    "csomerlot"
#define AIO_KEY         "a8c43f552c52450386ce83e3a14eb00a"

/************************* Site-specific vars ********************************/
#define SITE_NAME  "home_test2"
#define READ_DELAY 300000          //in milliseconds, if its less than 30s then it gets throttled by adafruit.io
#define TRANSMIT_DELAY 2           // how many READ_DELAY loops before tx
