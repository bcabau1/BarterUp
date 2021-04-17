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
        $query = "select * from trades";
        $result = mysqli_query($con, $query);
        if ($result && mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $query1 = "select user.user_id as initiatorId, user.username as initiator, item.item_name as initiator_item
                FROM trades, user, item
                where user.user_id =" . $row['user_id_initiator'] . "
                and item.item_id = " . $row['item_id_initiator'] . "";
                $result1 = mysqli_query($con, $query1);
                $row1 = mysqli_fetch_assoc($result1);
                echo '
                <ul class="list-view">
                <li class="trader">
                    <p class="title">Trade Initiator</p>
                    <p class="initiator-name">Name: ' . $row1['initiator'] . '</p>
                    <p class="initiator-item">Item Name:' . $row1['initiator_item'] . '</p>
                </li>';

                $query2 = "select user.user_id as tradeeId, user.username as tradee, item.item_name as tradee_item
                FROM trades, user, item
                where user.user_id =" . $row['user_id_tradee'] . "
                and item.item_id = " . $row['item_id_tradee'] . "";
                $result2 = mysqli_query($con, $query2);
                if ($result2 && mysqli_num_rows($result2) > 0) {

                    $row2 = mysqli_fetch_assoc($result2);
                    echo '
                <li class="tradee">
                    <p class="title">Tradee</p>
                    <p class="tradee-name">Name: ' . $row2['tradee'] . '</p>
                    <p class="tradee-item">Item Name: ' . $row2['tradee_item'] . '</p>
                </li>
                </ul>';
                } else {
                    echo '
                <li class="tradee">
                    <p class="title">Trade an Item</p>
                    <select>
                        <option value="" disabled selected>Select an Item</option>' .
                        $query3 = 'select * from item where user_id = ' . $_SESSION['user_id'] . ';';
                    $result3 = mysqli_query($con, $query3);
                    if ($result3 && mysqli_num_rows($result3) > 0) {
                        while ($row3 = mysqli_fetch_assoc($result3)) {
                            echo '<option value="item">' . $row3['item_name'] . '</option>';
                        }
                        echo '</select>';
                        '
                    </li>
                </ul>';
                    }
                }
                echo '<h1>IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII</h1>';
            }
        }
        ?>
    </div>

    <script src="./shared/scripts.js"></script>
    <script>
        listToGrid();
    </script>
</body>

</html>