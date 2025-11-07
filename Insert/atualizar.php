<?php 

    include "conexao.php";

    $id=$_POST['id'];
    $nome=$_POST['novoNome'];
    $email=$_POST['novoEmail'];

    if(isset($nome,$email)){
        $sql="UPDATE usuarios set nome_usuario='$nome', email='$email' where id_usuario='$id'";
    }

    if($conn->query($sql)===true){
            echo "Usuário atualizado com sucesso.<br>";
        echo "<a href='select.php'>Voltar para lista</a>";
    } else {
        echo "Erro ao atualizar: " . $conn->error;
    }

    $conn->close();

?>