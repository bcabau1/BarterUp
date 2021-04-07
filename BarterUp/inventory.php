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
        table,
        th,
        td {
            border-collapse: collapse;
            border: 1px solid black;
            width: 100%;
        }

        table.center {
            margin-left: auto;
            margin-right: auto;
        }

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
    <div class="container">
        <?php include("./shared/header.php"); ?>
        <div class="wrapper">
            <div class="welcome">
                Hello, <?php echo $user_data['username']; ?>
            </div>
            <h1>Inventory</h1>

            <table>
                <tr>
                    <th>Item</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Item Condition</th>
                </tr>
                <tr>
                    <td>asdf </td>
                    <td> asdf</td>
                    <td> asdf</td>
                    <td> asdf</td>
                </tr>
                <tr>
                    <td> asdf</td>
                    <td> asdf</td>
                    <td>asdf </td>
                    <td> asdf</td>
                </tr>
            </table>
        </div>
    </div>
</body>

</html>