#include <ESP8266WiFi.h>
#include <PubSubClient.h>

#define estado_topic "101/ventana"        //topic
#define NB_TRYWIFI 50     //numero de intentos para conectar a WIFI

int Pin_reedswitch = 12; //GPIO12 D6 Wemos mini     
int state = 2;
String _estado; 

// Connect to the WiFi
const char* ssid = "Wifired_f";
const char* password = "HEPoLXe5dF";
const char* mqtt_server = "192.168.1.230";      //Broker MQTT
 
WiFiClient espClient;
PubSubClient client(espClient);
//-------------------------------------------------
void reconnect() {
 while (!client.connected()) {    //usermqtt      //passmqtt
 if (client.connect("reedswitch", "tfgmosquitto", "tfgmosquitto")) {
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
 pinMode(Pin_reedswitch, INPUT);
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
}
//-------------------------------------------------
void loop()
{ 
    if (!client.connected()) {
      reconnect();
    }
    delay(500);  
    state = digitalRead(Pin_reedswitch);
    if(state){
      _estado = "OPEN";
    }else{
      _estado = "CLOSED";  
    }
    Serial.print("Estado: ");
    Serial.println(_estado); //Escribe el estado de la puerta o ventana
    client.publish(estado_topic, String(_estado).c_str(), true); //Envia OPEN ó CLOSED
 
    delay(150);                                  
    ESP.deepSleep(0);
    delay(150);    
}
//-------------------------------------------------
