<?php

include ('Mobile_Detect/Mobile_Detect.php');
$tipo_detectado = new Mobile_Detect();
/****************************************
**establecemos conexion con el servidor.
**nombre del servidor: localhost.
**Nombre de usuario: root.
**Contraseña de usuario: ""
**Base de datos: login
*/
$mysqli = new mysqli('localhost','root','','login')or die ('Ha fallado la conexión: '.mysqli_connect_errno().PHP_EOL);
 
/*caturamos nuestros datos que fueron enviados desde el formulario mediante el metodo POST
**y los almacenamos en variables.*/
$usuario = $_POST["admin"];   
$password = $_POST["password_usuario"];

/*Consulta de mysql con la que indicamos que necesitamos que seleccione
**solo los campos que tenga como nombre el que se le ha enviado desde el formulario*/

$result = $mysqli->query("SELECT * FROM admin WHERE username = '$usuario'");

//Validamos si el nombre del administrador existe en la base de datos o es correcto
if($row = mysqli_fetch_array($result))
{     
    //Si el usuario es correcto ahora validamos su contraseña
     if($row["password"] == $password) {
         //Creamos sesión
         session_start();
         //Almacenamos el nombre de usuario en una variable de sesión usuario
         $_SESSION['usuario'] = $usuario;
         //Redireccionamos a la pagina: index.php
         if ($tipo_detectado->isMobile()) {
             header("Location: http://fuentedelasalud.ddns.net:8081/basicui/app");
         }else{
             header("Location: http://fuentedelasalud.ddns.net:8081/habpanel/index.html#/");
         }
     }
     else
     {
      //En caso que la contraseña sea incorrecta enviamos un msj y redireccionamos a index.php
      ?>
       <script languaje="javascript">
        alert("Contraseña Incorrecta --> 1234");
        location.href = "logout.php";
       </script>
      <?php

     }
}
else
{
     //en caso que el nombre de administrador es incorrecto enviamos un msj y redireccionamos a index.php
    ?>
     <script languaje="javascript">
      alert("El nombre de usuario es incorrecto! --> francis");
      location.href = "logout.php";
     </script>
    <?php
        
}
//Mysql_free_result() se usa para liberar la memoria empleada al realizar una consulta
mysqli_free_result($result);

/*Mysql_close() se usa para cerrar la conexión a la Base de datos y es 
**necesario hacerlo para no sobrecargar al servidor) .*/
mysqli_close();
?>