#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#define motion_status "101/movimiento"

//SSID/Password combination
const char* ssid = "Wifired_f";
const char* password = "HEPoLXe5dF";
const char* mqtt_server = "192.168.1.230";

WiFiClient espClient;
PubSubClient client(espClient);

const int Pin_datos_PIR = 0; //GPIO0 --> D3
//--------------------------------------------------
long unsigned int tiempoentradaestadoCERO;
boolean estado_CERO = true;
boolean toma_tiempo;
int PIR_estado = 0;
//------------------------SETUP----------------------
void setup() {
  Serial.begin(9600);
  pinMode(Pin_datos_PIR,INPUT);  // pir data as input
  Serial.print("Conectando a ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println(" WiFi conectada ");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
  client.setServer(mqtt_server, 1883);
}
//------------------------- LOOP ---------------------
void loop() {
  
  if(!client.connected()) {
      reconnect();
    }
    
 PIRSensor();
 
 delay(150);
 client.loop();  
 delay(150);
}
//------------------------------------------------------------------------------------
void reconnect() {
  while (!client.connected()) {
    Serial.print("Intentando conectar...");
    if (client.connect("PIR_Client", "tfgmosquitto", "tfgmosquitto")) {
      Serial.println("Cliente conectado");
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      delay(250);
    }
  }
}
//------------------------------------------------------------------------------------
void PIRSensor() {
  
   if(digitalRead(Pin_datos_PIR) == HIGH){
      if(estado_CERO){
         PIR_estado = 1;
         estado_CERO = false;
         Serial.println("Movimiento_detectado.");
         client.publish(motion_status, String(PIR_estado).c_str(), true);
         delay(50);
      }
      toma_tiempo = true;
   }
   //-------------------------------
   if(digitalRead(Pin_datos_PIR) == LOW) {
      if(toma_tiempo){
         tiempoentradaestadoCERO = millis();         
         toma_tiempo = false;
      }
      if(!estado_CERO && millis() - tiempoentradaestadoCERO > 7000) { //retraso cambio estado
         PIR_estado = 0;
         estado_CERO = true;
         Serial.println("Movimiento_Fin.");
         client.publish(motion_status, String(PIR_estado).c_str(), true);
         delay(50);
      }
   }
}
//------------------------------------------------------------------------------------
