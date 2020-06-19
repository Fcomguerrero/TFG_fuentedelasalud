#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <Adafruit_BME280.h>

#define SEALEVELPRESSURE_HPA (1013.25)
#define temperatura_topic	"101/temperatura"  //topic publica la temperatura
#define humedad_topic 		"101/humedad"      //topic publica la humedad
#define presion_topic 		"101/presion"      //topic publica la presion
#define altitud_topic 		"101/altitud"      //topic publica la altitud
#define NB_TRYWIFI 50   							//intentos para conectar"

Adafruit_BME280 bme;

// Connect to the WiFi
const char* ssid = "Wifired_f";
const char* password = "HEPoLXe5dF";
const char* mqtt_server = "192.168.1.230";	//servidor mosquitto Broker MQTT
 
WiFiClient espClient;						//crea un cliente para conectar con una IP
PubSubClient client(espClient);	
//-------------------------------------------------
void reconnect() {

 while (!client.connected()) {
 if (client.connect("BMP280_101","tfgmosquitto", "tfgmosquitto")) {
  Serial.println("connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
 } else {
  Serial.print("failed, rc=");
  Serial.print(client.state());
  delay(250);
  }
 }
}
//-------------------------------------------------
void setup()
{
 Serial.begin(9600);
 bme.begin(0x76);
 WiFi.begin(ssid, password);
 int _try = 0;
 while(WiFi.status()!= WL_CONNECTED){
  delay(250);
  Serial.print("."); 
  _try++;
  if ( _try >= NB_TRYWIFI ) {
     Serial.println("Imposible conectar a la red WiFi");
     ESP.deepSleep(60*1000000);
    }
 }
 client.setServer(mqtt_server, 1883);
}
//-------------------------------------------------
void loop()
{     
    if (!client.connected()) {
      reconnect();
    }
    delay(150);
    float temp = bme.readTemperature();
    delay(10);
    client.publish(temperatura_topic, String(temp).c_str(), true);
    float hum = bme.readHumidity();
    delay(10);
    client.publish(humedad_topic, String(hum).c_str(), true);
    float pres = bme.readPressure() / 100.0F;
    delay(10);
    client.publish(presion_topic, String(pres).c_str(), true);
    float alti = bme.readAltitude(SEALEVELPRESSURE_HPA);
    delay(10); 
    client.publish(altitud_topic, String(alti).c_str(), true);
 
    delay(150);                                    
    ESP.deepSleep(300*1000000); //despierta cada 5 minutos 300.000.000 microsegundos
        
}
//-------------------------------------------------
