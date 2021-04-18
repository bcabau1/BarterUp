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
    <link rel="stylesheet" href="./inventory.css?v=<?php echo time(); ?>">
</head>

<body>
    <?php include("./header.php"); ?>
    
        <div class="wrapper">
        <div class="view_main">
        <div class="page_name">
        <h1>My Inventory</h1>
        </div>
            <div class="view_wrap list-view" style="display:block;">
               <?php 
                $query = "select * from item where user_id = '".$_SESSION['user_id']."'; ";
                $result = mysqli_query($con, $query);

                if ($result && mysqli_num_rows($result) > 0) {
                     while($row= mysqli_fetch_assoc($result)) {
                        echo 
                        '<div class="view_item">
                            <div class="vi_left">
                                <p class="title">'.$row['item_name'].'</p>
                                <p class="content">ID:'.$row['item_id'].'</p>
                            </div>
                            <div class="vi_middle">
                                <h5>Condition:</h5>
                                <p class="content">'.$row['item_condition'].'</p>
                            </div>
                            <div class="vi_right">
                                <h5>Description:</h5>
                                <p class="content">'.$row['description'].'</p>
                            </div>
                            <div class="vi_rightmost">
                            <form method="post" action=""><input type="submit" name="trade_submit_'.$row['item_id'].'" class="btn btn-primary" value="Trade"></form>
                            </div>
                         </div> ';

                        if (isset($_POST['trade_submit_'.$row['item_id'].''])) {
                            $query1 = "insert into trades (item_id_initiator, user_id_initiator) values ('".$row['item_id']."','".$_SESSION['user_id']."');";

                            if(mysqli_query($con, $query1)) {
                                echo "<meta http-equiv='refresh' content='0'>";
                            } else echo 'error';
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