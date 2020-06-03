<?php

function databaseConnection(): PDO
{
    static $connection = null;
    if ($connection === null)
    {
        $connection = new PDO(DB_DSN, DB_USER, DB_PASSWORD);
        $connection->query('set names utf8');
    }
    return $connection;
}

function getFeedback(string $email): array
{
    $connection = databaseConnection();
    $email = $connection->quote($email);
    $checking = "SELECT * FROM user WHERE email = ${email}";
    $result = $connection->query($checking)->fetch(PDO::FETCH_ASSOC);
    if ($result)
    {
        $sql = "SELECT user.name, user.email, user.country, user.gender, GROUP_CONCAT(message SEPARATOR '<br>') FROM message INNER JOIN user ON message.user_id = user.id WHERE user.email = ${email}";
        return $connection->query($sql)->fetch(PDO::FETCH_ASSOC);
    }
    return[];
}
