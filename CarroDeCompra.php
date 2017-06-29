<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Carrito de Compras</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<h1>Carrito De Compras</h1>
		<a href="./carritodecompras.php" title="ver carrito de compras">
			<img src="./imagenes/carrito.png">
		</a>
	</header>
	<section>
		
	<?php
		
		$re=mysql_query("select * from productos")or die(mysql_error());
		while ($f=mysql_fetch_array($re)) {
		?>


			<div class="Producto">
			<center>
				<img src="./producto/<?php echo $f['imagen'];?>"><br>
				<span><?php echo $f['nombre'];?></span><br>
			</center>
		</div>
	<?php
		}
	?>		
	</section>
</body>
</html>