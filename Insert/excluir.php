<?php 

    include "conexao.php";

    $id=$_GET['id'];

    $sql="DELETE FROM USUARIOS WHERE id_usuario='$id'";

    if($conn->query($sql)===true){
        echo "Deletado com sucesso";
    }

?>