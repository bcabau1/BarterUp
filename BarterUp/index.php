<?php 
session_start();

	include("config.php");
	include("functions.php");

	$user_data = check_login($con);

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>BarterUp</title>

	<style type="text/css">
		/* override browser default */
		html,
		body {
			margin: 0;
			padding: 0;
		}

		/* use viewport-relative units to cover page fully */
		body {
			height: 100vh;
			width: 100vw;
			font: 14px sans-serif;
		}

		h1 {
			text-align: center;
		}

		.container {
			width: 500px;
			background-color: #e6ebe6;
			margin: 0 auto;
			padding: 5%;
			box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
		}

	</style>
</head>

<body>
	<div class="container">
		<a href="logout.php">Logout</a>
		<h1>Hello, <?php echo $user_data['username']; ?></h1>
		<div id="center_button">
		<button onclick="location.href='inventory.php'">View Inventory</button>
		<button onclick="location.href='add_inventory.php'">Add to Inventory</button>
		
		</div>
	</div>
</body>

</html>