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
        <h1>Trade History</h1>
        </div>
            <div class="view_wrap list-view" style="display:block;">
               <?php 
                $query = "select * from trade_history where user_history_id_initiator = '".$_SESSION['user_id']."'
                            UNION select * from trade_history where user_history_id_tradee =  '".$_SESSION['user_id']."';";
                $result = mysqli_query($con, $query);
                if ($result && mysqli_num_rows($result) > 0) {
                     while($row= mysqli_fetch_assoc($result)) {
                         if($row['user_history_id_initiator'] == $_SESSION['user_id'])   {
                            echo 
                            '<div class="view_item">
                                <div class="vi_left">
                                    <h5>As Initiator</h5>
                                    <p class="content">Trade #'.$row['trade_id'].'</p>
                                </div>
                                <div class="vi_middle">
                                    <h5>Traded With:</h5>
                                    <p class="content">'.$row['user_history_id_tradee'].'</p>
                                </div>
                                <div class="vi_right">
                                    <h5>Traded:</h5>
                                    <p class="content">'.$row['item_history_id_initiator'].'</p>
                                </div>
                                <div class="vi_rightest">
                                    <h5>For:</h5>
                                    <p class="content">'.$row['item_history_id_tradee'].'</p>
                                </div>
                             </div>';
                         }
                         else if($row['user_history_id_tradee'] == $_SESSION['user_id']) {
                            echo 
                            '<div class="view_item">
                                <div class="vi_left">
                                    <h5>As Tradee</h5>
                                    <p class="content">Trade #'.$row['trade_id'].'</p>
                                </div>
                                <div class="vi_middle">
                                    <h5>Traded With:</h5>
                                    <p class="content">'.$row['user_history_id_initiator'].'</p>
                                </div>
                                <div class="vi_right">
                                    <h5>Traded:</h5>
                                    <p class="content">'.$row['item_history_id_tradee'].'</p>
                                </div>
                                <div class="vi_rightest">
                                    <h5>For:</h5>
                                    <p class="content">'.$row['item_history_id_initiator'].'</p>
                                </div>
                             </div>';
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