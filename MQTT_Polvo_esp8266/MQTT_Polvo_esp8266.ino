#include <ESP8266WiFi.h>
#include <PubSubClient.h>

#define topic "101/polvo" 
#define NB_TRYWIFI 50 

unsigned int samplingTime = 280;
unsigned int deltaTime = 40;
unsigned int sleepTime = 9680;
float voMeasured = 0;
float calcVoltage = 0;
float dustDensity = 0;

int measurePin = 0; //Analogico A0
int ledPower = 12;  //D6

// Connect to the WiFi
const char* ssid = "Wifired_f";
const char* password = "HEPoLXe5dF";
const char* mqtt_server = "192.168.1.230";      //Broker MQTT
 
WiFiClient espClient;
PubSubClient client(espClient);
//-------------------------------------------------
void reconnect() {
 while (!client.connected()) {
 if (client.connect("polvo", "tfgmosquitto", "tfgmosquitto")) {
  Serial.println("conectado");
  Serial.print("Direccion IP: ");
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
 pinMode(ledPower,OUTPUT);
 WiFi.begin(ssid, password);
 int _try = 0;
 while(WiFi.status()!= WL_CONNECTED){
  delay(500);
  Serial.print(".");
  _try++;
  if ( _try >= NB_TRYWIFI ) {
     Serial.println("Imposible conectar a la red WiFi");
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
  delay(1000);
  digitalWrite(ledPower,LOW);  //encendido led
  delayMicroseconds(samplingTime);

  voMeasured = analogRead(measurePin);

  delayMicroseconds(deltaTime);
  digitalWrite(ledPower,HIGH);  //apagado led
  delayMicroseconds(sleepTime);

  calcVoltage = voMeasured*(5.0/1024);
  dustDensity = 0.17*calcVoltage-0.1;

  if ( dustDensity < 0)
  {
    dustDensity = 0.00;
  }

  Serial.println("Raw Signal Value (0-1023):");
  Serial.println(voMeasured);

  Serial.println("Voltage:");
  Serial.println(calcVoltage);

  Serial.println("polvo densidad:");
  Serial.println(dustDensity);
  client.publish(topic, String(dustDensity).c_str(), true);

  delay(10000);    
}
//-------------------------------------------------
