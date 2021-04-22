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
	<link rel="stylesheet" href="signup.css?v=<?php echo time(); ?>">
	
</head>

<body>
<?php include("./unauthHeader.php"); ?>
	<div class="wrapper">
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