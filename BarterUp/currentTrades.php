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
        <?php
        $query = "select x.*, y.* from 
        (SELECT user.username as initiator, item.item_name as initiator_item
        FROM trades, user, item
        where user.user_id = trades.user_id_initiator
        and item.item_id = trades.item_id_initiator) as x, 
        (SELECT user.username as tradee, item.item_name as tradee_item
        FROM trades, user, item
        where user.user_id = trades.user_id_tradee
        and item.item_id = trades.item_id_tradee) as y;";
        $result = mysqli_query($con, $query);
        if ($result && mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                echo '
            <ul class="list-view">
                <li class="trader">
                    <p class="title">Trade Initiator</p>
                    <p class="initiator-name">Name: '.$row['initiator'].'</p>
                    <p class="initiator-item">Item Name:'.$row['initiator_item'].'</p>
                </li>

                <li class="tradee">
                    <p class="title">Tradee</p>
                    <p class="tradee-name">Name: '.($row['tradee'] == null ? "None":$row['tradee']).'</p>
                    <p class="tradee-item">Item Name: '.($row['tradee_item'] == null ? "None":$row['tradee_item']).'</p>
                </li>
            </ul>';
            }
        } ?>
    </div>

    <script src="./shared/scripts.js"></script>
    <script>
        listToGrid();
    </script>
</body>

</html>