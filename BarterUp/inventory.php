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
    <title>BarterUp</title>
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
                $query = "select * from item where user_id = '" . $_SESSION['user_id'] . "'; ";
                $result = mysqli_query($con, $query);


                if ($result && mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        $query2 = "select * from trades where '" . $row['item_id'] . "' = item_id_initiator or '" . $row['item_id'] . "' = item_id_tradee";
                        $result2 = mysqli_query($con, $query2);
                        echo
                        '<div class="view_item">
                            <div class="vi_left">
                                <p class="title">' . $row['item_name'] . '</p>
                                <p class="content">ID:' . $row['item_id'] . '</p>
                            </div>
                            <div class="vi_middle">
                                <h3>Condition:</h3>
                                <p class="content">' . $row['item_condition'] . '</p>
                            </div>
                            <div class="vi_right">
                                <h3>Description:</h3>
                                <p class="content">' . $row['description'] . '</p>
                            </div>';
                        if (mysqli_num_rows($result2) == 0) {
                            echo '
                            <div class="vi_rightmost">
                            <form method="post" action=""><input type="submit" name="trade_submit_' . $row['item_id'] . '" class="btn btn-primary" value="Trade"></form>
                            </div>
                            <div class="vi_rightmostmost">
                            <form method="post" action=""><input type="submit" class="delete-button" name="trade_delete_' . $row['item_id'] . '" class="btn btn-primary" value="Delete"></form>
                            </div>';
                        }
                        echo '
                         </div> ';

                        if (isset($_POST['trade_submit_' . $row['item_id'] . ''])) {
                            $query1 = "insert into trades (item_id_initiator, user_id_initiator) values ('" . $row['item_id'] . "','" . $_SESSION['user_id'] . "');";

                            if (mysqli_query($con, $query1)) {
                                echo "<meta http-equiv='refresh' content='0'>";
                            } else echo 'error';
                        }

                        if (isset($_POST['trade_delete_' . $row['item_id'] . ''])) {
                            $query6 = "delete from item where item_id = '" . $row['item_id'] . "' and user_id = '" . $_SESSION['user_id'] . "';";

                            if (mysqli_query($con, $query6)) {
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