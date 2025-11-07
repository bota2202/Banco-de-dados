<?php

    $host = 'localhost';
    $db = 'livraria';
    $password = '@Plast..2024';
    $user = 'root';

    $conn = new mysqli($host, $user, $password, $db);

    if($conn->connect_error){
        die('Erro de conexão '.$conn->connect_error);
    }

?>
