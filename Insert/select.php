<?php

    echo '<link rel=stylesheet href=style.css>';

    include "conexao.php";

    $result = $conn->query("SELECT * FROM usuarios");

    echo "<h2>Usuários</h2>";

    echo "<table border='1' cellpadding='5' cellspacing='0'>";
    echo "<tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Ações</th>
        </tr>";

    while ($row = $result->fetch_assoc()) {

        echo "<tr>";
        echo "<td>" .$row['id_usuario'] . "</td>";
        echo "<td>" . $row['nome_usuario'] . "</td>";
        echo "<td>" . $row['email'] . "</td>";
        echo "<td><a href='editar.php?id=" . $row['id_usuario'] . "'>Editar </a><a href='excluir.php?id=" . $row['id_usuario'] . "'> Excluir</a></td>";
        echo "</tr>";
    }

    echo "</table>";

    echo "<br><a href='index.html'>Voltar</a>";

    $conn->close();

?>