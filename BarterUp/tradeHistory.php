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
    <link rel="stylesheet" href="./tradeHistory.css?v=<?php echo time(); ?>">
</head>

<body>
    <?php include("./header.php"); ?>

    <div class="wrapper">
        <div class="view_main">
            <div class="page_name">
                <h1>My Trade History</h1>
            </div>

            <?php
            $query = "select * from trade_history";
            $result = mysqli_query($con, $query);
            if ($result && mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    if ($row['user_history_id_initiator'] == $_SESSION['user_id'] || $row['user_history_id_tradee'] == $_SESSION['user_id']) {
                        $query1 = "select user.user_id as initiatorId, user.username as initiator, item.item_name as initiator_item
                    FROM trades, user, item
                    where user.user_id =" . $row['user_history_id_initiator'] . "
                    and item.item_id = " . $row['item_history_id_initiator'] . "";
                        $result1 = mysqli_query($con, $query1);
                        if ($result1 && mysqli_num_rows($result1) > 0) {
                            $row1 = mysqli_fetch_assoc($result1);
                            echo '
                        <ul class="list-view">
                            <li class="trader">
                                <h3 class="title">Trade Initiator</h3>
                                <p class="initiator-name"><b>Name:</b>' . $row1['initiator'] . '</p>
                                <p class="initiator-item"><b>Item Name:</b>' . $row1['initiator_item'] . '</p>
                            </li>';
                        }
                        $query2 = "select user.user_id as tradeeId, user.username as tradee, item.item_name as tradee_item
                    FROM trades, user, item
                    where user.user_id =" . $row['user_history_id_tradee'] . "
                    and item.item_id = " . $row['item_history_id_tradee'] . "";
                        $result2 = mysqli_query($con, $query2);
                        if ($result2 && mysqli_num_rows($result2) > 0) {
                            $row2 = mysqli_fetch_assoc($result2);
                            echo '
                            <li class="tradee">
                                <h3 class="title">Tradee</h3>
                                <p class="tradee-name"><b>Name:</b>' . $row2['tradee'] . '</p>
                                <p class="tradee-item"><b>Item Name:</b>' . $row2['tradee_item'] . '</p>
                            </li>
                        </ul>';
                        }
                    }
                }
            }
            ?>
        </div>
    </div>
    </div>

    <script src="./shared/scripts.js"></script>
    <script>
        listToGrid();
    </script>
</body>

</html>