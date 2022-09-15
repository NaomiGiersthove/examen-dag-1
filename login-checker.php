<?php

class LoginChecker extends LoginDatabase {
    private $naam;
    private $wachtwoord;

    public function __construct($naam, $wachtwoord) {
        $this->naam = $naam;
        $this->wachtwoord = $wachtwoord;
    }

    public function loginUser() {
        if ($this->emptyInput() == false) {
            // echo "Empty input!";
            header("location: medewerker-login.php?error=emptyinput"); // !!!
            exit();
        }

        // als er geen error komt. Wordt de user ingelogd met de gegevens bij de database. linked to login-database.php
        $this->getUser($this->naam, $this->wachtwoord);
    }

    //checks als er niks gevuld is.
    private function emptyInput() {
        $result;
        if (empty($this->naam) || empty($this->wachtwoord)) {
            $result = false;
        } else {
            $result = true;
        }
        return $result;
    }
}