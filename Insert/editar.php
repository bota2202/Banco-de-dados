<?php 

    include "conexao.php";

    $id=$_GET['id'];

    $result = $conn->query("SELECT * FROM usuarios WHERE id_usuario = $id");

    $usuario=$result->fetch_assoc();

?>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>Editar usuário</h2>
    <form action="atualizar.php" method="post">
        <input type="hidden" required name="id" value="<?php echo $id ;?>">
        <input type="text" name="novoNome" required value="<?php echo $usuario['nome_usuario'] ?>">
        <input type="text" name="novoEmail" required value="<?php echo $usuario['email'] ?>">
        <button type="submit">Salvar</button>
        <a href="select.php">Cancelar</a>
    </form>
</body>
</html>