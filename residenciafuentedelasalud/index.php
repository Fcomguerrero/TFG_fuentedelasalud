<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Residencia fuente de la salud</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body {
    background-image: url("fondo1.jpg");
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
    background-color: #FF9966;
}
.tLevel1_Arial {
}
</style>
</head>
<body>
<div id="login">
    <h3 class="text-center text-white pt-5"></h3>
    <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div class="login-box col-md-12">
                   <form id="login-form" class="form" action="validar_usuario.php" method="post">    
                        <h3 class="text-center Level1_Arial" style="color: white">Iniciar sesión</h3>
                     <div class="form-group">
                            <label for="username" class="Level1_Arial" style="color: white">Usuario:</label><br>
                            <input name="admin" required="required" type="text" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="password" class="tLevel1_Arial" style="color: white">Contraseña:</label><br>
                            <input name="password_usuario" required="required" type="password" class="form-control"/>
                        </div>
                       <div class="form-group">
                            <!--<input type="submit" name="iniciar"  value="Iniciar sesión">-->
                            <button type="submit" style="color: #FF6600" class="btn btn-light">Entrar</button>
                        </div>                        
                   </form>
                </div>
            </div>
      </div>
    </div>
</div>
</body>
</html>