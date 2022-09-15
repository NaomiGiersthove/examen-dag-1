<?php
class SignupDatabase extends dbh {
    protected function setUser($id, $naam, $wachtwoord, $emailadres) {
        // Dit maakt een user aan de databse.
        $stmt = $this->connect()->prepare('INSERT INTO medewerkers (id, naam, wachtwoord, emailadres) VALUES (?, ?, ?, ?);'); //input statement

        if (!$stmt->execute(array($id, $naam, $wachtwoord, $emailadres))) {
            $stmt = null;
            header("location: medewerker-signup?error=stmtfailed"); //!!!
            exit();
        }

        $stmt = null;
    }

    protected function checkUser($naam, $emailadres) {
        // Dit check als er een bestand gebruik al in de database.
        $stmt = $this->connect()->prepare('SELECT id FROM medewerkers WHERE id = ? OR emailadres = ?;'); //select statement !!!

        if (!$stmt->execute(array($naam, $emailadres))) {
            $stmt = null;
            header("location: medewerker-signup?error=stmtfailed"); //!!!
            exit();
        }

        $resultCheck;
        
        if ($stmt->rowCount() > 0) {
            $resultCheck = false;
        } else {
            $resultCheck = true;
        }

        return $resultCheck;
    }
}