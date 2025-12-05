<?php 
    include "conexao.php";

$nome     = $_POST['nome'] ?? '';
$telefone = $_POST['telefone'] ?? '';
$cpf      = $_POST['cpf'] ?? '';
$estado   = $_POST['estado'] ?? '';
$cidade   = $_POST['cidade'] ?? '';
$bairro   = $_POST['bairro'] ?? '';
$rua      = $_POST['rua'] ?? '';

$stmt=$conn->prepare('INSERT INTO Clientes (nome_cliente, cpf_cliente, telefone_cliente, estado_cliente, cidade_cliente, bairro_cliente, rua_cliente) values (?,?,?,?,?,?,?)');

$stmt->bind_param('sssssss',$nome, $cpf, $telefone, $estado, $cidade, $bairro, $rua);

if($stmt->execute()){
    echo "<p id=texto-cadastro>Sucesso ao cadastrar usuário</p> ";
}else{
    echo "<p id=texto-cadastro>Falha ao cadastrar usuário</p> ";
}

header('location: listar.php');

$conn->close();
$stmt->close();

?>