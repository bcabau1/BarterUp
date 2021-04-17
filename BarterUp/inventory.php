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
                         </div>';
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