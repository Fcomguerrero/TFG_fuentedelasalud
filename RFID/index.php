<!DOCTYPE html>
<html lang="es">
<html>
	<head>
		<meta nombre="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="utf-8">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<script src="js/bootstrap.min.js"></script>
		<title>Registro de accesos</title>
        <style>
            .table {
                margin-left: 25px;
                margin-top: 5px;
                width: 98%;
                color: #ffffff;
                background-color: rgba(34,51,68,0.60);
            }
        </style>
	</head>
	<body>
		<div class="table-bordered">
            <div class="row">
                <table class="table">
                  <thead>
                    <tr bgcolor="#223344">
                        <th>ID Tarjeta</th>
                        <th>Nombre</th>
                        <th>Fecha de acceso</th>
                        <th>Tipo de acceso</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php
                  include 'database.php';
                  $pdo = Database::connect();
                  $sql = 'SELECT * FROM `access_control` ORDER BY last_access DESC';
                  foreach ($pdo->query($sql) as $row) {
                      echo '<tr>';
                      echo '<td>'. $row['id_card'] . '</td>';
                      echo '<td>'. $row['name_patient'] . '</td>';
                      echo '<td>'. $row['last_access'] . '</td>';
                      echo '<td>'. $row['type_access'] . '</td>';
                      echo '</tr>';
                  }
                  Database::disconnect();
                  ?>
                  </tbody>
				</table>
			</div>
		</div> <!-- /container -->
	</body>
</html>







