<!DOCTYPE html>
<html lang="es">
<html>
	<head>
		<meta nombre="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="utf-8">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<script src="js/bootstrap.min.js"></script>
		<title>Registro de alertas</title>
        <style>
            .table{
                margin-left: 25px;
                margin-top: 5px;
                width: 94%;
                color: #ffffff;
                background-color: rgba(34,51,68,0.60);
            }
        </style>
	</head>
	<body>
		<div class="table-bordered">
            <div class="row">
                <table  class="table">
                  <thead>
                    <tr bgcolor="#223344">
                        <th>Habitación</th>
                        <th>Tipo de sensor</th>
                        <th>Fecha de alerta</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php
                  include 'database.php';
                  $pdo = Database::connect();
                  $sql= 'SELECT a.data_of_alert, s.id_room, a.type_of_sensor FROM sensors_box AS s INNER JOIN alert_register AS a ON s.id = a.id_sensors_box INNER JOIN patients AS p ON p.id_room = s.id_room ORDER BY a.data_of_alert DESC LIMIT 20';                  
                  foreach ($pdo->query($sql) as $row) {
                      echo '<tr>';
                      echo '<td>'. $row['id_room'] . '</td>';
                      echo '<td>'. $row['type_of_sensor'] . '</td>';
                      echo '<td>'. $row['data_of_alert'] . '</td>';
                      echo '</tr>';
                  }
                  Database::disconnect();
                  ?>
                  </tbody>
				</table>
			</div>
		</div> <!-- /tabla -->
	</body>
</html>







