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
    $checking = "SELECT EXISTS (SELECT * FROM user WHERE email = ${email}) AS data";
    $result = $connection->query($checking)->fetch();
    if ($result['data'])
    {
        $sql = "SELECT user.name, user.email, user.country, user.gender, message.message FROM message JOIN user ON message.user_id = user.id WHERE user.email = ${email}";
        $stmt = $connection->query($sql);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    return[];
}

function getFeedbackId(string $email): array
{
    $connection = databaseConnection();
    $email = $connection->quote($email);
    $checking = "SELECT EXISTS (SELECT * FROM user WHERE email = ${email}) AS data";
    $result = $connection->query($checking)->fetch();
    if ($result['data'])
    {
        $sql = "SELECT id FROM user WHERE email = ${email}";
        $stmt = $connection->query($sql);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    return[];
}
