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
	<title>SignUp</title>

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
		<h1>Welcome To BarterUp!</h1>
		<p>Please fill this form to create an account.</p>

		<form method="post">
			<div class="row">
				<label for="Username">Username</label>
				<input type="text" name="username" class="form-control">
			</div>

			<div class="row">
				<label for="Password">Password</label>
				<input type="password" name="password" class="form-control">
			</div>

			<div class="row">
				<input type="submit" class="btn btn-primary" value="Submit">
				<input type="reset" class="btn btn-default" value="Reset">
			</div>

			<p>Already have an account? <a href="./login.php">Login here</a>.</p>
		</form>
	</div>
</body>

</html>