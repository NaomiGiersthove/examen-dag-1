<?php
class LoginDatabase extends dbh {
    protected function getUser($naam, $wachtwoord)
    {
        // Dit neemt een user aan de databse.
        $stmt = $this->connect()->prepare('SELECT wachtwoord FROM medewerkers WHERE id = ? or emailadres = ?;'); //select statement !!!

        if (!$stmt->execute(array($naam, $wachtwoord))) {
            $stmt = null;
            header("location: medewerker-login.php?error=stmtfailed"); // !!!
            exit();
        }

        if ($stmt->rowCount() == 0) {
            $stmt = null;
            header("location: medewerker-login.php?error=usernotfound"); // !!!
            exit();
        }

        // zoek als user of email en password is gelijk in database.
        $pwdHashed = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $checkPwd = $pwdHashed; // !!!

        if ($checkPwd == false) {
            $stmt = null;
            header("location: medewerker-login.php?error=wrongpassword"); // !!!
            exit();
        } elseif ($checkPwd == true) {
            $stmt = $this->connect()->prepare('SELECT * FROM medewerkers WHERE id = ? or emailadres = ? AND wachtwoord = ?;'); // !!!

            if (!$stmt->execute(array($naam, $wachtwoord))) {
                $stmt = null;
                header("location: medewerker-login.php?error=stmtfailed"); // !!!
                exit();
            }

            if ($stmt->rowCount() == 0) {
                $stmt = null;
                header("location: medewerker-login.php?error=usernotfound"); // !!!
                exit();
            }

            $user = $stmt->fetchAll(PDO::FETCH_ASSOC);

            session_start();
            $_SESSION["naam"] = $user[0]["naam"]; // !!!

            $stmt = null;
        }
    }
}