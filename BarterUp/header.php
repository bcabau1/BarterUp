<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="./header.css?v=<?php echo time(); ?>">
</head>

<body>
  <div class="header-right">

    <div class="header">
      <p>BarterUp</p>
    </div>

    <div class="user-drop">
      <button class="user-dropbtn"><?php echo $user_data['username']; ?>
        <i class="fa fa-caret-down"></i>
      </button>
      <div class="user-dropcontent">
        <a href="./logout.php">Logout</a>
      </div>
    </div>

    <a href='./inventory.php'>Inventory</a>
    <a href='./addInventory.php'>Add to Inventory</a>
    <a href="./currentTrades.php">Home</a>  
    
  </div>
</body>

</html>