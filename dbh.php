<?php

class dbh {

    private $servername;
    private $username;
    private $password;
    private $dbname;
    private $charset;

    protected function connect() {

        $this->servername = "localhost";
        $this->username = "root";
        $this->password = "";
        $this->dbname = "superiorwaste";
        $this->charset = "utf8mb4";

        try {
            $dsn = "mysql:host=" . $this->servername . ";dbname=" . $this->dbname . ";charset=" . $this->charset;
            $db = new PDO($dsn, $this->username, $this->password);
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $db;
        } catch (PDOException $e) {
            echo "No database connection. Failed:" . $e->getMessage() . "<br/>";
            die();
        }
    }

    public function select($statement, $named_placeholder)
    {
        $stmt = $this->dbh->prepare($statement);
        $stmt->execute($named_placeholder);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $result;
    }

    public function update($statement, $named_placeholder, $locatie)
    {
        $stmnt = $this->dbh->prepare($statement);
        $stmnt->execute($named_placeholder);
        header("location: $locatie");
        exit();
    }

    public function delete($statement, $named_placeholder, $locatie)
    {
        $stmt = $this->dbh->prepare($statement);

        $stmt->execute($named_placeholder);

        header("location: $locatie");
        exit();
    }


    public function insert($sql, $named_placeholder_array, $locatie)
    {
        try {
            $this->dbh->beginTransaction();

            $statement = $this->dbh->prepare($sql);
            $statement->execute($named_placeholder_array);

            $this->dbh->commit();
            header("location: $locatie");
        } catch (Exception $e) {
            $this->dbh->rollback();
            echo $e->getMessage();
        }
    }
}
?>
