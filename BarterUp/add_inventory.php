<?php 
session_start();

	include("config.php");
	include("functions.php");

	$user_data = check_login($con);
?>


<!DOCTYPE html>

<html lang="en">

<head>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script async>
		$(function(){
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
	<div class="wrapper">
        <a href="index.php">Home Page</a> 
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
				<input type="text" name="item_id" class="form-control">
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
            </div>
            </div>
			<div id="music" class="form-group">
				<label for="Item">Album Name</label><br>
				<input type="text" name="item_id" class="form-control"><br>
				<label for="Item">Artist Name</label><br>
				<input type="text" name="item_id" class="form-control">
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
            </div>
            </div>
			<div id="videogame" class="form-group">
				<label for="Item">Game Platform</label><br>
				<input type="text" name="item_id" class="form-control">
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
            </div>
            </div>
			
		</form>
        <div id="center_button">
            <button onclick="location.href='inventory.php'">Add</button>
        </div>
	</div>
</body>
</html>