<?php 
session_start();

	include("config.php");
	include("functions.php");

	$user_data = check_login($con);

?>

<!DOCTYPE html>
<html>
<head>
	<title>BarterUp</title>
</head>
<body>

	<a href="logout.php">Logout</a>
	<h1>Home Page</h1>

	<br>
	Hello, <?php echo $user_data['username']; ?>
	<br>
	<div id="center_button">
    <button onclick="location.href='inventory.php'">View Inventory</button>
	</div>
</body>
</html>