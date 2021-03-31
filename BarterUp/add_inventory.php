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
	<title>Login</title>

	<style type="text/css">
		body {
			font: 14px sans-serif;
		}

		.wrapper {
			width: 350px;
			padding: 20px;
			margin: 0 auto;
		}
        .welcome {
            float: right;
        }
	</style>
</head>

<body>
	<div class="wrapper">
        <a href="index.php">Home Page</a> 
        <div class="welcome">
            Hello, <?php echo $user_data['username']; ?>
        </div>
		<h1>Add to Inventory</h1>
        <div id="center_button">
            <button onclick="location.href='inventory.php'">Add</button>
        </div>
	</div>
</body>

</html>