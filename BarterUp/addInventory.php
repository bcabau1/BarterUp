<?php
ini_set('display_errors', '1');
error_reporting(E_ALL);
session_start();

include("config.php");
include("functions.php");

$user_data = check_login($con);

if ($_SERVER['REQUEST_METHOD'] == "POST") {

	if (isset($_POST['movie_submit'])) {
		$userid = $user_data['user_id'];
		$movie_title = $_POST['title'];
		$condition = $_POST['condition'];
		$genre = $_POST['movie_genre'];
		$director = $_POST['director'];
		$description = $_POST['description1'];
		if (!empty($movie_title) && !empty($condition)) {
			$querya = "insert into item (user_id, item_name, item_condition, description, category_id) 
					values ('$userid', '$movie_title','$condition', '$description', 1001);";
			mysqli_query($con, $querya);
			$last_id = $con->insert_id;
			$querya1 = "insert into movie (item_movie_id, director_name, movie_genre) 
						values ('$last_id','$director', '$genre');";
			mysqli_query($con, $querya1);
			header("Location: addInventory.php");
			die;
		} else {
			echo "Please enter some valid information!";
		}
	} elseif (isset($_POST['music_submit'])) {
		$userid = $user_data['user_id'];
		$album = $_POST['album_name'];
		$artist = $_POST['artist'];
		$genre = $_POST['music_genre'];
		$condition = $_POST['condition'];
		$description = $_POST['description2'];
		if (!empty($album) && !empty($condition)) {
			$queryb = "insert into item (user_id, item_name, item_condition, description, category_id) 
					values ('$userid', '$album', '$condition', '$description', 1000);";
			mysqli_query($con, $queryb);
			$last_id = $con->insert_id;
			$queryb1 = "insert into music (artist_name, item_music_id, music_genre) 
						values ('$artist','$last_id', '$genre');";
			mysqli_query($con, $queryb1);
			header("Location: addInventory.php");
			die;
		} else {
			echo "Please enter some valid information!";
		}
	} elseif (isset($_POST['vg_submit'])) {
		$platform = $_POST['platform'];
		$userid = $user_data['user_id'];
		$game_title = $_POST['game_title'];
		$genre = $_POST['game_genre'];
		$condition = $_POST['condition'];
		$description = $_POST['description3'];
		if (!empty($platform) && !empty($condition)) {
			$queryc = "insert into item (user_id, item_name, item_condition, description, category_id) 
					values ('$userid', '$game_title','$condition', '$description', 1002);";
			mysqli_query($con, $queryc);
			$last_id = $con->insert_id;
			$queryc1 = "insert into video_game (item_game_id, game_platform, game_genre) 
						values ('$last_id','$platform', '$genre');";
			mysqli_query($con, $queryc1);
			header("Location: addInventory.php");
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
 	<script src="https://kit.fontawesome.com/3aa4932d1b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="addInventory.css">
	<meta charset="UTF-8">
	<title>Login</title>
	
</head>

<body><?php include("./header.php"); ?>
	<div class="container">
		<div class="page_name">
			<h1>Add to Inventory</h1>
		</div>
		<div class="wrapper">
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
					<input type="text" name="title" class="form-control" placeholder="Title"><br>
					<label for="Item">Movie Genre</label><br>
					<input type="text" name="movie_genre" class="form-control"  placeholder="Horror, Drama, Action..."><br>
					<label for="Item">Director Name</label><br>
					<input type="text" name="director" class="form-control"  placeholder="Somebody">
					<div id="misc" class="misc-group">
						<label for="Condition">Condition</label><br>
						<select name="condition" id="condition">
							<option value="excellent">Excellent</option>
							<option value="very nice">Very Nice</option>
							<option value="average">Average</option>
							<option value="poor">Poor</option>
						</select>
						<br><label for="Category">Description</label><br>
						<input type="text" name="description1" class="form-control"  placeholder="Once upon a time..."><br>
						<input type="submit" name="movie_submit" class="btn btn-primary" value="Add">
					</div>
				</div>

				<div id="music" class="form-group">
					<label for="Item">Album Name</label><br>
					<input type="text" name="album_name" class="form-control" placeholder="Vinyl"><br>
					<label for="Item">Music Genre</label><br>
					<input type="text" name="music_genre" class="form-control" placeholder="Rap, Pop, Rock..."><br>
					<label for="Item">Artist Name</label><br>
					<input type="text" name="artist" class="form-control" placeholder="Somebody">
					<div id="misc" class="misc-group">
						<label for="Condition">Condition</label><br>
						<select name="condition" id="condition">
							<option value="excellent">Excellent</option>
							<option value="very nice">Very Nice</option>
							<option value="average">Average</option>
							<option value="poor">Poor</option>
						</select>
						<br><label for="Category">Description</label><br>
						<input type="text" name="description2" class="form-control" placeholder="Once upon a time..."><br>
						<input type="submit" name="music_submit" class="btn btn-primary" value="Add">
					</div>
				</div>

				<div id="videogame" class="form-group">
					<label for="Item">Game Title</label><br>
					<input type="text" name="game_title" class="form-control" placeholder="Title"><br>
					<label for="Item">Game Platform</label><br>
					<input type="text" name="platform" class="form-control" placeholder="Gaming Console"><br>
					<label for="Item">Game Genre</label><br>
					<input type="text" name="game_genre" class="form-control" placeholder="Casual, Arcade, Action...">
					<div id="misc" class="misc-group">
						<label for="Condition">Condition</label><br>
						<select name="condition" id="condition">
							<option value="excellent">Excellent</option>
							<option value="very nice">Very Nice</option>
							<option value="average">Average</option>
							<option value="poor">Poor</option>
						</select>
						<br><label for="Category">Description</label><br>
						<input type="text" name="description3" class="form-control"placeholder="Once upon a time..."><br>
						<input type="submit" name="vg_submit" class="btn btn-primary" value="Add">
					</div>
				</div>

			</form>

		</div>
	</div>
</body>

</html>