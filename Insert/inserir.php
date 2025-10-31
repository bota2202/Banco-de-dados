<?php 

    $nome=$_POST['nome'];
    $email=$_POST['email'];

    $host='localhost';
    $db='livraria';
    $password='@Plast..2024';
    $user='root';

    $conn=new mysqli($host,$user,$password,$db);

    if($conn->connect_error){
        die('Erro de conexão '.$conn->connect_error);
    }else{
        echo "Sucesso";
    }

    $sql = "INSERT INTO usuarios (nome_usuario, email) VALUES ('$nome', '$email')";

    if($conn->query($sql)===true){
        echo "Dados salvos com sucesso";
    }else{
        echo "Erro: $conn->error";
    }

    $conn->close();

?>