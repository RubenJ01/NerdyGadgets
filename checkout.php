<!--de code voor de afrekenpagina-->
<?php
include __DIR__ . "/header.php";
include "cartfuncties.php";
$totaalprijs = 0;
if(!isset($_SESSION['totaalprijs'])) {
    $_SESSION["totaalprijs"] = $totaalprijs;
}
?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>Afrekenen bestelling</title>
    <link rel="stylesheet" href="Public/CSS/cart.css">
</head>
<body>
<div class="maincontainer">
    <h1 style="font-size:40px;">Order summary</h1><br>
    <table>
        <thead><br>
        <tr class="titles">
            <td>Name:</td>
            <td>Quantity:</td>
            <td>Price per product (incl. btw):</td>
        </tr>
        </thead>
        <tbody class="bodycontainer">
        <style>
            .container {
                margin-left: 0;
            }

            tbody {
                display: block;
                max-height: 500px;
            }

            thead,
            tbody tr {
                display: table;
                width: 100%;
            }

            thead {
                width: 100%;
            }

            table {
                width: 1300px;
            }

            td:nth-child(1) {
                width: 34%
            }

            td:nth-child(3) {
                width: 34%
            }
            form {
                height: 20px;
                width: 900px;
                padding-left: 5%;
            }
            h3 {
                text-align: right;
            }
        </style>
        <?php
        $cart = getCart();
        foreach ($cart as $nr => $aantal):
            $StockItem = getStockItem($nr, $databaseConnection);
            $stockItemImage = getStockItemImage($nr, $databaseConnection);
            $totaalprijs += $cart[$nr] * $StockItem['SellPrice'];
            if(isset($_SESSION['totaalprijs'])) {
                $_SESSION["totaalprijs"] = $totaalprijs;
            }
            ?>
            <tr class="data">
                <td><h6><?= $StockItem['StockItemName'] ?></h6></td>
                <td><h4><?= $cart[$nr] ?></h4></td>
                <td><h4>€<?= number_format((float)$StockItem['SellPrice'], 2, '.', '') ?></h4></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
    <br>
    <h3>Total price (incl. btw): €<?= number_format((float)$totaalprijs, 2, '.', '') ?></h3>
    <br><br>
</div>
<form method="post" action="cart.php">
    <h4 style="font-size:40px;">Contact information: </h4>
    <label style="font-size:20px;" for="fname">First name:</label>
    <input type="text" id="fname" name="fname"><br><br>
    <label style="font-size:20px;" for="lname">Last name:</label>
    <input type="text" id="lname" name="lname"><br><br>
    <label style="font-size:20px;" for="pcode">Postal code:</label>
    <input type="text" id="pcode" name="pcode"><br><br>
    <label style="font-size: 20px;" for="hnumber">House number:</label>
    <input type="number" id="hnumber" name="hnumber">
    <label style="font-size: 20px;" for="city">City:</label>
    <input type="text" id="city" name="city">
    <label style="font-size: 20px;" for="e-mail">E-mail:</label>
    <input type="number" id="e-mail" name="e-mail">
    <label style="font-size: 20px;" for="hnumber">Phone number:</label>
    <input type="number" id="pnumber" name="pnumber">
    <input type="submit" value="Back to shopping cart" style="font-size: 17px;" href="http://localhost/NerdyGadgets/checkout.php"
           class="form-submit-button">
    <input type="submit" value="Confirm and continue" style="font-size: 17px;" href="http://localhost/NerdyGadgets/ideal.php"
           class="form-submit-button">

</form>
</body>
</html>
