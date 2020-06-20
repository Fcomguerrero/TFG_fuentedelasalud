<?php
	
	require 'database.php';

	$id = null;
    if ( !empty($_GET["UIDresult"])) {
        $id = $_GET["UIDresult"];  		//Número de tarjeta
    }else{
        $id = "NULL";  //ID a NULL para evitar un id de tarjeta NULO
    }

    $pdo = Database::connect();
	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT patients.fullname, patients.type_access FROM patients where id_card = ?";
    $q = $pdo->prepare($sql);
	$q->execute(array($id));
	$data = $q->fetch(PDO::FETCH_ASSOC);
	Database::disconnect();

    date_default_timezone_set("Europe/Madrid");

    $msg = null;
	if (null==$data['fullname']) {
		$msg = "El ID de tu tarjeta / no esta registrado !!!";
		echo $msg;
		$id_card = $id;
        $name_patient = "No existe";
        $type_access = "No existe";
	} else {
		$msg = null;
		$id_card = $id;
        $name_patient = $data['fullname'];
        $type_access = $data['type_access'];
	}
    $last_access = date('Y-m-d H:i:s');
    // insert datos
    $pdo = Database::connect();
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "INSERT INTO access_control (id_card,name_patient,last_access,type_access) values(?, ?, ?, ?)";
    $q = $pdo->prepare($sql);
    $q->execute(array($id_card,$name_patient,$last_access,$type_access));
    Database::disconnect();

?>