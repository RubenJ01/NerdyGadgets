<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="utf-8">
    <title>Betaling is voltooid scherm</title>
</head>
<body style="background-color:#FFFFFF;">
<style>
    h1 {
        text-align: center;
    }
    h2 {
        text-align: center;
    }

    form {
        text-align: center;
    }

    img {
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 10%;
    }
    .form-submit-button {
        /*background: #FFA500;*/
        color: white;
        border-style: outset;
        /*border-color: #FFA500;*/
        border-radius: 12px;
        height: 45px;
        width: 500px;
    }
</style>
<br>
<h1 style="font-size:300px;"></h1>
<h2 style="font-size:20px;">De betaling is voltooid.</h2>
<form method="post" action="browse.php">
    <br>
    <input style="font-size:20px;" type="submit" value="Keer terug naar NerdyGadgets" href="http://localhost/NerdyGadgets/ideal.php"
           class="form-submit-button">
</form>
</body>
</html>