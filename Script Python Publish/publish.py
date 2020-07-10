import paho.mqtt.client as mqttClient
import time
 
def on_connect(client, userdata, flags, rc):
 
    if rc == 0:
        print("Connected to broker code=",rc)
        global Connected                #Use global variable
        Connected = True                #Signal connection 
    else: 
        print("Connection failed")
 
Connected = False   #global variable for the state of the connection

broker_address= "192.168.1.230"
port = 1883
user = "tfgmosquitto"
password = "tfgmosquitto"
 
client = mqttClient.Client("Python")               #create new instance
client.on_connect = on_connect                      #attach function to callback
client.connect(broker_address, port=port)          #connect to broker
client.username_pw_set(user, password=password)    #set username and password
 

client.loop_start()        #start the loop

while Connected != True:    #Wait for connection
    time.sleep(1)
 
try:
    while True:
 
        time.sleep(3)
        client.publish("informacion/estado", "-")
        time.sleep(3)	     
        client.publish("informacion/estado", "-") 
        value =input("entra un mensaje: ")  
        #client.publish("informacion/estado", "Test Python running...")      
        # Asistencia 101-104
        time.sleep(3)      
        client.publish("101/temperatura/superior", 26)
        time.sleep(1)
        client.publish("102/humedad/superior", 60)
        time.sleep(1)
        client.publish("103/ventana/configuracion", "OPEN")
        time.sleep(1)
        client.publish("104/polvo/superior", 0.5)
        time.sleep(1)
        client.publish("104/ventana/configuracion", "CLOSED")
        time.sleep(5)
        client.publish("101/temperatura", 26.3)
        time.sleep(4)
        client.publish("102/humedad", 63)
        time.sleep(4)
        client.publish("104/polvox", 0.3)
        time.sleep(4)
        client.publish("104/polvox", 0.6)
        time.sleep(4)       
        client.publish("103/ventana", "CLOSED")        
        time.sleep(4)
        value =input("apaga la alarma 103: ")  
        time.sleep(4)
        client.publish("101/temperatura", 25.4)
        time.sleep(4)
        client.publish("102/asistencia", "ON")
        time.sleep(4)
        client.publish("104/asistencia", "ON")
        time.sleep(4)
        value =input("apaga asistencias: ") 
        time.sleep(4)
        client.publish("104/ventana", "OPEN")
        time.sleep(4)
        value =input("apaga avisos 104: ") 
        
        #Habitacion 102

        # client.publish("informacion/estado", "fijando temperatura minima a 20 en 102")              
        # time.sleep(1)
        # client.publish("102/temperatura/inferior", 20)
        # time.sleep(1)
        # client.publish("informacion/estado", "fijando temperatura maxima a 27 en 102")
        # time.sleep(1)
        # client.publish("102/temperatura/superior",27)
        # time.sleep(1)
        # client.publish("informacion/estado", "fijando temperatura a 28 Grados en 102")
        # time.sleep(3)
        # client.publish("102/temperatura", 28)
        # time.sleep(3)
        # client.publish("informacion/estado", "Apagado de alarma 102")
        # time.sleep(3) 
        # client.publish("102/alarma", 0)
        # time.sleep(3)
        # # habitacion 103
        # client.publish("informacion/estado", "fijando humedad minima a 14 en 103")              
        # time.sleep(3)
        # client.publish("103/humedad/inferior", 14)
        # time.sleep(3)
        # client.publish("informacion/estado", "fijando humedad maxima a 60 en 103")
        # time.sleep(1)
        # client.publish("103/humedad/superior", 60)
        # time.sleep(1)
        # client.publish("informacion/estado", "Humedad de 103 a 61")
        # time.sleep(1)
        # client.publish("103/humedad", 61)
        # time.sleep(3)
        # client.publish("informacion/estado", "Apagado de alarma 103") 
        # time.sleep(3)        
        # client.publish("103/alarma", 0)
        # time.sleep(2)
        # client.publish("informacion/estado", "La humedad en 103 entra dentro de los valores normales") 
        # time.sleep(3)
        # client.publish("103/humedad", 50)
        # time.sleep(2)

        # client.publish("informacion/estado", "La humedad en 103 entra dentro de los valores normales")               
        # time.sleep(1)
        # client.publish("103/humedad", 53)
        # time.sleep(1)
        # # Abriendo todas las ventanas
        # client.publish("informacion/estado", "ABRIENDO TODAS LAS VENTANAS")
        # time.sleep(3)	     
        # client.publish("101/ventana/configuracion", "No_mostrar")
        # client.publish("104/ventana/configuracion", "No_mostrar")
        # client.publish("103/ventana/configuracion", "No_mostrar")
        # client.publish("104/ventana/configuracion", "No_mostrar")
        # time.sleep(1)
        # client.publish("101/ventana", "OPEN")
        # time.sleep(1)
        # client.publish("102/ventana", "OPEN")
        # time.sleep(1)
        # client.publish("103/ventana", "OPEN")
        # time.sleep(1)
        # client.publish("104/ventana", "OPEN")
        # time.sleep(3)
        # client.publish("informacion/estado", "Cerrando TODAS LAS VENTANAS")
        # time.sleep(3)
        # client.publish("101/ventana", "CLOSED")
        # time.sleep(1)
        # client.publish("102/ventana", "CLOSED")
        # time.sleep(1)
        # client.publish("103/ventana", "CLOSED")
        # time.sleep(1)
        # client.publish("104/ventana", "CLOSED")
        # time.sleep(3)
        # #Alarma de camara en 104
        # client.publish("informacion/estado", "Alarma en 104 camara")
        # time.sleep(3)
        # client.publish("104/camara", "CAIDA")
        # time.sleep(3)
        # client.publish("informacion/estado", "FIN de camara en 104")
        # time.sleep(3)
        # client.publish("102/camara", "OK")
        # # Alarmas en 101
        # time.sleep(1)	     
        # client.publish("101/temperatura/inferior", 15)
        # time.sleep(1)
        # client.publish("101/temperatura/superior", 30)
        # time.sleep(1)
        # client.publish("101/temperatura", 31)
        
        # value =input("Apagar alarma 101: ")
        # time.sleep(3)
        # client.publish("101/humedad/inferior", 40)
        # time.sleep(3)
        # client.publish("101/humedad/superior", 60)
        # time.sleep(3)
        # client.publish("101/humedad", 63)

        # value =input("Apagar alarma 101: ")
        # time.sleep(3)
        # client.publish("101/polvo/inferior", 0.3)
        # time.sleep(3)
        # client.publish("101/polvo/superior", 0.7)
        # time.sleep(3)
        # client.publish("101/polvo", 0.9)

        # value =input("Apagar alarma 101: ")
        # time.sleep(3)
        # client.publish("101/ventana/configuracion", "OPEN")     
        # time.sleep(3)
        # client.publish("101/ventana", "CLOSED")
        # time.sleep(3)

        # value =input("Apagar alarma 101: ")        
        # time.sleep(3)
        # client.publish("101/temperatura", 22)
        # time.sleep(3)
        # client.publish("101/humedad", 50)
        # time.sleep(3)
        # client.publish("101/polvo", 0.5)
        # time.sleep(3)
        # client.publish("101/ventana", "OPEN")

        
        time.sleep(3)
 
except KeyboardInterrupt:
 
    client.disconnect()
    client.loop_stop()