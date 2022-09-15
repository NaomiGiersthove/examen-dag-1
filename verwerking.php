<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="logo.png">

    <link rel="stylesheet" href="style.css">
    <script type="text/javascript" src="checkbox.js"></script>
    <script type="text/javascript" src="check_updater.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Remas</title>

</head>


<body>

    <?php
    if (isset($_SESSION["id"])) {
    ?>
        <header class="p-3 bg-dark text-black">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-black text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                            <use xlink:href="#bootstrap" />
                        </svg>
                    </a>
                    <a href="index.php"><img src="logo.png" alt="Logo" width="50" height="50"></a>
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href=".php" class="nav-link px-2 text-black" style="background-color:powderblue;">ReMaS Superior Waste Recycling</a></li>
                        <li><a href=".php" class="nav-link px-2 text-black"></a></li>
                        
                    </ul>

                    <div class="text-end">
                        <button type="button" class="btn btn-outline-light me-2">Medewerker: <?php echo $_SESSION["user_id"]; ?></button>
                        <a href="logout.php"><button class="btn btn-outline-light me-2">Log uit</button></a>
                        <a href="medewerker-signup.php"><button type="button" class="button btn btn-warning" style="background-color:Gray; border:2px solid White;">Registreer</button></a>
                    </div>
                </div>
            </div>
        </header>

    <?php
    } else {
    ?>
        <header class="p-3 bgcolor:white text-black" style="background-color: #d7ebec>
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-black text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                            <use xlink:href="#bootstrap" />
                        </svg>
                    </a>
                    <a href="index.php"><img src="logo.png" alt="Logo" width="50" height="50"></a>
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="index.php" class="nav-link px-2 text-black">ReMaS Superior Waste Recycling</a></li>
                    </ul>

                    <div class="text-end">
                        <a >versie 1.00</a>
                        <a href="logout.php"><button class="btn btn-outline-light me-2">Log uit</button></a>
                    </div>
                                        
                </div>
            

            </div>
        </header>

        <body>

        <ul>
                    <br>
                    <img src="logo.png" width="70" height="70" style="display: block; margin-right: auto; margin-left: auto;">
                    <br>
                    <li><a href=inname.php>Inname</a><li>
                    <li><a href=verwerking.php>Verwerking</a><li>
                    <li><a href=uitgifte.php>Uitgifte</a><li>
                    <li><a href=rapportage.php>Rapportage</a><li>
                    <li><a href=onderhoud.php>Onderhoud</a><li>
                </ul>

                <style>
                    ul {
                        list-style-type: none;
                        margin: 0;
                        padding: 0;
                        width: 200px;
                        background-color: #d7ebec;
                    }

                    li a {
                        display: block;
                        color: #000;
                        padding: 8px 16px;
                        text-decoration: none;
                    }

/* Change the link color on hover */
                    li a:hover {
                        background-color: powderblue;
                            color: white;
                    }
                </style>
        </body>
</body>

<body>
    <br>
            <h1>Ingenomen apparaten</h1>

                <table style="width:100%">
                    <thead>
                        <tr>
                            <th>Apparaat</th>
                            <th>Gewicht</th>
                            <th>Tijdstip ontvangst</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <th></th>
                            <td><td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><td>
                        </tr>
                    </tbody>
                </table>

</body>
    <?php
    }
    ?>