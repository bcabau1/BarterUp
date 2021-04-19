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
    <link rel="stylesheet" href="./myTrades.css?v=<?php echo time(); ?>">
</head>

<body>
    <?php include("./header.php"); ?>

    <div class="wrapper">
    <div class="page_name">
        <h1>My Trades</h1>
    </div>
        <?php
        $query = "select * from trades";
        $result = mysqli_query($con, $query);
        if ($result && mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                if($row['user_id_initiator'] == $_SESSION['user_id'] || $row['user_id_tradee'] == $_SESSION['user_id']){
                    $query1 = "select user.user_id as initiatorId, user.username as initiator, item.item_name as initiator_item
                    FROM trades, user, item
                    where user.user_id =" . $row['user_id_initiator'] . "
                    and item.item_id = " . $row['item_id_initiator'] . "";
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
                    where user.user_id =" . $row['user_id_tradee'] . "
                    and item.item_id = " . $row['item_id_tradee'] . "";
                    $result2 = mysqli_query($con, $query2);
                    if ($result2 && mysqli_num_rows($result2) > 0) {
                        $row2 = mysqli_fetch_assoc($result2);
                        echo '
                            <li class="tradee">
                                <h3 class="title">Tradee</h3>
                                <p class="tradee-name"><b>Name:</b>'.$row2['tradee'].'</p>
                                <p class="tradee-item"><b>Item Name:</b>'.$row2['tradee_item'].'</p>
                            </li>
                        </ul>';
                        if($row['user_id_initiator'] == $_SESSION['user_id'])    { 
                        echo '
                        <form method="post" action="">
                            <input class="accept-button" type="submit" name="trade_accept_'.$row['trade_id'].'" class="btn btn-primary" value="Accept">
                            <input class="reject-button" type="submit" name="trade_reject_'.$row['trade_id'].'" class="btn btn-primary" value="Reject">
                        </form>';
                        if (isset($_POST['trade_accept_'.$row['trade_id'].''])) {
                            $query5 = "insert into trade_history (item_history_id_initiator, item_history_id_tradee, trade_id, user_history_id_initiator, user_history_id_tradee)
                                         values (". $row['item_id_initiator'] .",". $row['item_id_tradee'] .",". $row['trade_id'] .",". $row['user_id_initiator'] .",". $row['user_id_tradee'] .");
                                       update item set user_id = ". $row['user_id_tradee'] ." where item_id = ". $row['item_id_initiator'] .";
                                       update item set user_id = ". $row['user_id_initiator'] ." where item_id = ". $row['item_id_tradee'] .";
                                       delete from trades where trade_id = ". $row['trade_id'] ."";

                            if(mysqli_multi_query($con, $query5)) {
                                echo "<meta http-equiv='refresh' content='0'>";
                            } else echo 'error';
                        }
                        else if (isset($_POST['trade_reject_'.$row['trade_id'].'']))    {
                            $query6 = "update trades set item_id_tradee = null, user_id_tradee = null where trade_id = ". $row['trade_id'] ."; "; 
                            if(mysqli_query($con, $query6)) {
                                echo "<meta http-equiv='refresh' content='0'>";
                            } else echo 'error';
                        }
                    }
                    }
                    else{
                        echo '
                            <li class="tradee">
                                <h3 class="title">Tradee</h3>
                                <p class="tradee-name"><b>Name:</b> None </p>
                                <p class="tradee-item"><b>Item Name:</b> None </p>
                            </li>
                        </ul>';
                    }
                }
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