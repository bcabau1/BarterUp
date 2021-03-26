<?php
session_start();

include("config.php");
include("functions.php");


if ($_SERVER['REQUEST_METHOD'] == "POST") {
	//something was posted
	$username = $_POST['username'];
	$password = $_POST['password'];

	if (!empty($username) && !empty($password) && !is_numeric($username)) {

		//save to database
		$query = "insert into user (username,password) values ('$username','$password')";
		mysqli_query($con, $query);

		header("Location: login.php");
		die;
	} else {
		echo "Please enter some valid information!";
	}
}
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
	</style>
</head>

<body>
	<div class="wrapper">
		<h1>BarterUp</h1>
		<h2>Signup</h2>
		<p>Please fill this form to create an account.</p>

		<form method="post">
			<div class="form-group">
				<label for="Username">Username</label>
				<input type="text" name="username" class="form-control">
			</div>

			<div class="form-group">
				<label for="Password">Password</label>
				<input type="password" name="password" class="form-control">
			</div>

			<div class="form-group">
				<input type="submit" class="btn btn-primary" value="Submit">
				<input type="reset" class="btn btn-default" value="Reset">
			</div>

			<p>Already have an account? <a href="./login.php">Login here</a>.</p>
		</form>
	</div>
</body>

</html>