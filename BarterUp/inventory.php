<?php
session_start();

include("config.php");
include("functions.php");

$user_data = check_login($con);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Trades</title>
    <script src="https://kit.fontawesome.com/3aa4932d1b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="inventory.css">
</head>

<body>
    <?php include("./header.php"); ?>
    <div class="page_name">
        <h1>My Inventory</h1>
    </div>
        <div class="links">
            <ul>
                <li class="li-list active" data-view="list-view"> <i class="fas fa-list"></i>List View </li>

                <li class="li-list" data-view="grid-view"><i class="fas fa-th-large"></i> Grid View </li>
            </ul>
        </div>
        <div class="wrapper">
        <div class="view_main">
            <div class="view_wrap list-view" style="display:block;">
               <?php 
                $query = "select * from item where user_id = '".$_SESSION['user_id']."'; ";
                $result = mysqli_query($con, $query);
                if ($result && mysqli_num_rows($result) > 0) {
                     while($row= mysqli_fetch_assoc($result)) {
                        echo 
                        '<div class="view_item">
                            <div class="vi_left">
                                <img src="./resources/profile-pic.png" alt="profile">
                            </div>
                            <div class="vi_right">
                                <p class="title">'.$row['item_name'].'</p>
                                <p class="content">'.$row['description'].'</p>
                            <div class="btn">View More</div>
                        </div>
                    </div>';
                    }
                }
               ?>
            </div>

            <div class="view_wrap grid-view" style="display:none;">
                <div class="view_item">
                    <div class="vi_left">
                        <img src="./resources/profile-pic.png" alt="profile">
                    </div>
                    <div class="vi_right">
                        <p class="title">Person</p>
                        <p class="content">Personjhkdffvh ikjuadfvkhjdffv kjasdfvdsafvdfvdkjb jkonlsdfafva</p>
                        <div class="btn">View More</div>
                    </div>
                </div>
                <div class="view_item">
                    <div class="vi_left">
                        <img src="./resources/profile-pic.png" alt="profile">
                    </div>
                    <div class="vi_right">
                        <p class="title">Person</p>
                        <p class="content">Personjhkdffvh ikjuadfvkhjdffv kjasdfvdsafvdfvdkjb jkonlsdfafva</p>
                        <div class="btn">View More</div>
                    </div>
                </div>
                <div class="view_item">
                    <div class="vi_left">
                        <img src="./resources/profile-pic.png" alt="profile">
                    </div>
                    <div class="vi_right">
                        <p class="title">Person</p>
                        <p class="content">Personjhkdffvh ikjuadfvkhjdffv kjasdfvdsafvdfvdkjb jkonlsdfafva</p>
                        <div class="btn">View More</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="./shared/scripts.js"></script>
    <script>
        listToGrid();
    </script>
</body>

</html>