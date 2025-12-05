<?php 

    $conn=new mysqli("localhost","root","@Plast..2024","mecanica");

    if($conn->connect_error){
        echo "Erro na conexão";
    }

?>