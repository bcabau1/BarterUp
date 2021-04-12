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
    <link rel="stylesheet" href="./currentTrades.css?v=<?php echo time(); ?>">
</head>

<body>
    <?php include("./header.php"); ?>
    <div class="page_name">
        <h1>All Current Trades</h1>
    </div>
    <div class="wrapper">
        <div class="view_main">
            <div class="list-view">
                <div class="view_item">
                    <div class="vi_left">
                        <img src="./resources/profile-pic.png" alt="profile">
                    </div>
                    <div class="vi_right">
                        <p class="title">Trader</p>
                        <p class="title">Name: Person</p>
                        <p class="item">Item: Item Name</p>
                        <div class="btn">View More</div>
                    </div>
                </div>
                <div class="view_item">
                    <div class="vi_left">
                        <img src="./resources/profile-pic.png" alt="profile">
                    </div>
                    <div class="vi_right">
                        <p class="title">Tradee</p>
                        <p class="title">Name: Person</p>
                        <p class="item">Item: Item Name</p>
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