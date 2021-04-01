<?php 
session_start();

	include("config.php");
	include("functions.php");

	$user_data = check_login($con);

    #$sql = "insert into barterup.item values ();"
	$showdiv = false;
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
        <form method="post">
			<div class="form-group">
				<label for="Category">Category</label><br>
				<select name="category" id="category">
				<option value="movie">Movie</option>
				<option value="music">Music</option>
				<option value="video_game">Video Game</option>
				<option value="misc">Miscellaneous</option>
				</select>
			</div>
			<div class="form-group">
				<label for="Item">Item</label><br>
				<input type="text" name="item_id" class="form-control">
			</div>
		
            <div class="form-group">
				<label for="Category">Description</label><br>
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