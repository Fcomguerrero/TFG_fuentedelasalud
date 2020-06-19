#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <Time.h>
#define _topic "101/asistencia"  //topic
#define _topictime "101/asistencia/tiempo"
#define NB_TRYWIFI 50     //numero de intentos para conectar a WIFI
#define _asistencia "ON"
#define ledPin 2

const char* ssid = "Wifired_f";
const char* password = "HEPoLXe5dF";
const char* mqtt_server = "192.168.1.230";      //Broker MQTT
unsigned long _time = 0;
int recibioasistencia = 1; //1 esta solicitando asistencia
//const byte ledPin = 0; // Pin D3
 
WiFiClient espClient;
PubSubClient client(espClient);
//--------------------------------------------------------------- 
void callback(char* topic, byte* payload, unsigned int length) {
 Serial.print("Llego un mensaje [");
 Serial.print(topic);
 Serial.print("] ");
 for (int i=0;i<length;i++) {
  char receivedChar = (char)payload[i];
  Serial.print(receivedChar);
  if (receivedChar == '1')
    digitalWrite(ledPin, LOW);
  if (receivedChar == '0')
   digitalWrite(ledPin, HIGH);
   recibioasistencia=0;
  }
  Serial.println();
}
//----------------------------------------
void reconnect() {
 while (!client.connected()) {    //usermqtt      //passmqtt
 if (client.connect("Asistencia", "tfgmosquitto", "tfgmosquitto")) {
  Serial.println("conectado");
  Serial.print("Direccion IP: ");
  Serial.println(WiFi.localIP());
   // ... and subscribe to topic
  client.subscribe("101/asistencia/visto");  //Se subcribe a 101/asistencia/visto recibe mensajes en este topic
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
 WiFi.begin(ssid, password);
 int _try = 0;
 while(WiFi.status()!= WL_CONNECTED){
  delay(500);
  Serial.print(".");
  _try++;
  if ( _try >= NB_TRYWIFI ) {
     Serial.println("Imposible conectar a la red WiFi");
     ESP.deepSleep(0);
    }
 }
 client.setServer(mqtt_server, 1883);
 client.setCallback(callback);
 pinMode(ledPin, OUTPUT);
}
//-------------------------------------------------
void loop()
{ 
    if (!client.connected()) {
      reconnect();
    }
    delay(250);   
    Serial.print("Asistecia: ");
    Serial.println(_asistencia);
    client.publish(_topic, String(_asistencia).c_str(), true); //Envia

    while(recibioasistencia == 1){ //mientras este pidiendo asistencia
      if (!client.connected()) {
        reconnect();
      }
      _time = millis();
      Serial.print("Time: ");
      Serial.println(_time);                               
      client.loop();
      delay(1000); 
    }
    client.publish(_topictime, String(_time).c_str(), true);
    delay(150);
    Serial.print("Ya recibio asistencia la persona ");
    ESP.deepSleep(0);
    delay(150); 
}
//-------------------------------------------------
