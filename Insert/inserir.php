<?php 

    include "conexao.php";

    $nome=$_POST['nome'];
    $email=$_POST['email'];

    if($nome && $email){
        $sql = "INSERT INTO usuarios (nome_usuario, email) VALUES ('$nome', '$email')";
    }

    if($conn->query($sql)===true){
        echo "Dados salvos com sucesso";
    }else{
        echo "Erro: $conn->error";
    }

    $conn->close();

?>