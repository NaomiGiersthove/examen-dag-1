<?php

class SignupChecker extends SignupDatabase {

    private $naam;
    private $wachtwoord;
    private $wachtwoord22;
    private $emailadres;

    public function __construct($naam, $wachtwoord, $wachtwoord2, $emailadres) {

        $this->naam = $naam;
        $this->wachtwoord = $wachtwoord;
        $this->wachtwoord2 = $wachtwoord2;
        $this->emailadres = $emailadres;
    }

    public function singupUser() {
        if ($this->emptyInput() == false) {
            // echo "Empty input!";
            header("location: medewerker-signup.php?error=emptyinput"); //!!!
            exit();
        } if ($this->invalidEmail() == false) {
            // echo "Invalid Email!";
            header("location: medewerker-signup.php?error=email"); //!!!
            exit();
        } if ($this->pwdMatch() == false) {
            // echo "Password doesn't match!";
            header("location: medewerker-signup.php?error=passwordmatch"); //!!!
            exit();
        } if ($this->useridTaken() == false) {
            // echo "Username or email taken!";
            header("location: medewerker-signup.php?error=usernameoremailtaken"); //!!!
            exit();
        }

        // als er geen error komt. Wordt de user aangemaakt bij de database. linked to signup-database.php
        $this->setUser($this->naam, $this->wachtwoord, $this->emailadres);
    }

    //checkt of er niks ingevuld is.
    private function emptyInput() {
        $result;
        if (empty($this->naam) || empty($this->wachtwoord) || empty($this->wachtwoord2) || empty($this->emailadres)) {
            $result = false;
        } else {
            $result = true;
        }
        return $result;
    }

    // checks of de juiste email is ingevult.
    private function invalidEmail() {
        $result;
        if (!filter_var($this->emailadres, FILTER_VALIDATE_EMAIL)) {
            $result = false;
        } else {
            $result = true;
        }
        return $result;
    }

    // checkt of wachtwoor 1 en 2 overeen komen.
    private function pwdMatch() {
        $result;
        if ($this->wachtwoord !== $this->wachtwoord2) {
            $result = false;
        } else {
            $result = true;
        }
        return $result;
    }

    // checkt voor betaande gebruikersnaam.
    private function useridTaken() {
        $result;
        if (!$this->checkUser($this->naam, $this->emailadres)) {
            $result = false;
        } else {
            $result = true;
        }
        return $result;
    }
}