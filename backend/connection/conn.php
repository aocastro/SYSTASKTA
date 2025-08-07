<?php

    $hostname = "localhost";
    $dbname = "systaskta";
    $username = "root";
    $password ="";

    try {
        $pdo = new PDO('mysql:host='.$hostname.';dbname='.$dbname, $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo 'A conexão com o banco de dados '.$dbname.', foi realizado com sucesso';
    } catch (PDOException $e) {
        echo 'Error: '.$e->getMessage();
    }