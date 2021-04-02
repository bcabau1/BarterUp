<?php 
session_start();

	include("config.php");
	include("functions.php");

	$user_data = check_login($con);

    #$sql = "insert into barterup.item values ();"
	$showdiv = false;
?>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	toggleFields();
	$("#cases").click(function () {
			toggleFields();
		});


	function toggleFields() {
		if ($("#cases").val() === "movie")	{
			$("#movie").show()
		}
		if ($("#cases").val() === "music")	{
			$("#music").show()
		}
		if ($("#cases").val() === "video_game")	{
			$("#videogame").show()
		}
		else	{
			$("#music").hide()
			$("#movie").hide()
			$("#videogame").hide()
		}
	}
}
</script>

<!DOCTYPE html>
<html lang="en">


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
			<div class="form-group">
				<label for="category">Category</label><br>
				<select name="category" id="cases">
					<option> Choose Category </option>
					<option value="movie">Movie</option>
					<option value="music">Music</option>
					<option value="video_game">Video Game</option>
					<option value="misc">Miscellaneous</option>
				</select>
			</div>
			<div id="movie" class="form-group">
				<label for="Item">Movie Title</label><br>
				<input type="text" name="item_id" class="form-control">
				
            </div>
			<div id="music" class="form-group">
				<label for="Item">Album Name</label><br>
				<input type="text" name="item_id" class="form-control"><br>
				<label for="Item">Artist Name</label><br>
				<input type="text" name="item_id" class="form-control">
            </div>
			<div id="videogame" class="form-group">
				<label for="Item">Game Platform</label><br>
				<input type="text" name="item_id" class="form-control">
		
            </div>
			<div id="misc" class="form-group">
				<label for="Condition">Condition</label><br>
				<select name="condition" id="condition">
					<option value="excellent">Excellent</option>
					<option value="very nice">Very Nice</option>
					<option value="average">Average</option>
					<option value="poor">Poor</option>
				</select>
				<br><br><label for="Category">Description</label><br>
				<textarea id="description" name="description" rows="4" cols="50">
                </textarea>
            </div>
		</form>
        <div id="center_button">
            <button onclick="location.href='inventory.php'">Add</button>
        </div>
	</div>
</body>
</html>
