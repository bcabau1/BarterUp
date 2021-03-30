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
    <style>
        table, th, td {
        border-collapse: collapse;
        border: 1px solid black;
        }
        table.center {
        margin-left: auto;
        margin-right: auto;
        }
    </style>
</head>
<body>

	<a href="index.php">Home Page</a>
	<h1>Add to your inventory</h1>

	<br>
	Hello, <?php echo $user_data['username']; ?>
	<br><br>
    <table>
        <tr>
            <th>Item</th>
            <th>Category</th>
            <th>Description</th>
            <th>Item Condition</th>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
	<div id="center_button">
    <button onclick="location.href='inventory.php'">Add</button>
	</div>
</body>
</html>