<?php
session_start();

include("config.php");
include("functions.php");

$user_data = check_login($con);

if ($_SERVER['REQUEST_METHOD'] == "POST") {

	if (isset($_POST['movie_submit'])) {
		$movie_title = $_POST['title'];
		$condition = $_POST['condition'];
		$genre = $_POST['movie_genre'];
		$director = $_POST['director'];
		$description = $_POST['description'];
		if (!empty($movie_title) && !empty($condition)) {
			#$query = "insert into movie (title) values ('$movie_title')";
			#mysqli_query($con, $query);
			header("Location: add_inventory.php");
			die;
		} else {
			echo "Please enter some valid information!";
		}
	} elseif (isset($_POST['music_submit'])) {
		$album = $_POST['album'];
		$artist = $_POST['artist'];
		$genre = $_POST['music_genre'];
		$condition = $_POST['condition'];
		$description = $_POST['description'];
		if (!empty($album) && !empty($artist) && !empty($condition)) {
			#$query = "insert into user (username,password) values ('$username','$password')";
			#mysqli_query($con, $query);
			header("Location: add_inventory.php");
			die;
		} else {
			echo "Please enter some valid information!";
		}
	} elseif (isset($_POST['vg_submit'])) {
		$platform = $_POST['platform'];
		$game_title = $_POST['game_title'];
		$genre = $_POST['game_genre'];
		$condition = $_POST['condition'];
		$description = $_POST['description'];
		if (!empty($platform) && !empty($condition)) {
			#$query = "insert into user (username,password) values ('$username','$password')";
			#mysqli_query($con, $query);
			header("Location: add_inventory.php");
			die;
		} else {
			echo "Please enter some valid information!";
		}
	}
}
?>


<!DOCTYPE html>

<html lang="en">

<head>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script async>
		$(function() {
			$('.form-group').hide();

			$('#cases').change(function() {
				$('.form-group').hide();
				$('#' + $(this).val()).show();
			})
		});
	</script>

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
	<div class="container"><?php include("./shared/header.php"); ?></div>
	<div class="wrapper">
		<div class="welcome">
			Hello, <?php echo $user_data['username']; ?>
		</div>
		<h1>Add to Inventory</h1>
		<form method="post">
			<div class="cat-group">
				<label for="category">Category</label><br>
				<select name="category" id="cases">
					<option> Choose Category </option>
					<option value="movie">Movie</option>
					<option value="music">Music</option>
					<option value="videogame">Video Game</option>
				</select>
			</div>

			<div id="movie" class="form-group">
				<label for="Item">Movie Title</label><br>
				<input type="text" name="title" class="form-control"><br>
				<label for="Item">Movie Genre</label><br>
				<input type="text" name="movie_genre" class="form-control"><br>
				<label for="Item">Director Name</label><br>
				<input type="text" name="director" class="form-control">
				<div id="misc" class="misc-group">
					<label for="Condition">Condition</label><br>
					<select name="condition" id="condition">
						<option value="excellent">Excellent</option>
						<option value="very nice">Very Nice</option>
						<option value="average">Average</option>
						<option value="poor">Poor</option>
					</select>
					<br><label for="Category">Description</label><br>
					<textarea id="description" name="description" rows="4" cols="50">
                </textarea>
					<input type="submit" name="movie_submit" class="btn btn-primary" value="Add">
				</div>
			</div>

			<div id="music" class="form-group">
				<label for="Item">Album Name</label><br>
				<input type="text" name="album_name" class="form-control"><br>
				<label for="Item">Music Genre</label><br>
				<input type="text" name="music_genre" class="form-control"><br>
				<label for="Item">Artist Name</label><br>
				<input type="text" name="artist" class="form-control">
				<div id="misc" class="misc-group">
					<label for="Condition">Condition</label><br>
					<select name="condition" id="condition">
						<option value="excellent">Excellent</option>
						<option value="very nice">Very Nice</option>
						<option value="average">Average</option>
						<option value="poor">Poor</option>
					</select>
					<br><label for="Category">Description</label><br>
					<textarea id="description" name="description" rows="4" cols="50">
                </textarea>
					<input type="submit" name="music_submit" class="btn btn-primary" value="Add">
				</div>
			</div>

			<div id="videogame" class="form-group">
				<label for="Item">Game Title</label><br>
				<input type="text" name="game_title" class="form-control"><br>
				<label for="Item">Game Platform</label><br>
				<input type="text" name="platform" class="form-control"><br>
				<label for="Item">Game Genre</label><br>
				<input type="text" name="game_genre" class="form-control">
				<div id="misc" class="misc-group">
					<label for="Condition">Condition</label><br>
					<select name="condition" id="condition">
						<option value="excellent">Excellent</option>
						<option value="very nice">Very Nice</option>
						<option value="average">Average</option>
						<option value="poor">Poor</option>
					</select>
					<br><label for="Category">Description</label><br>
					<textarea id="description" name="description" rows="4" cols="50">
                </textarea>
					<input type="submit" name="vg_submit" class="btn btn-primary" value="Add">
				</div>
			</div>

		</form>

	</div>
</body>

</html>