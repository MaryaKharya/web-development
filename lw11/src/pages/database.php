<?php

function getFeedbackId(string $email): array
{
    $connection = databaseConnection();
    $email = $connection->quote($email);
    $checking = "SELECT * FROM user WHERE email = ${email}";
    $result = $connection->query($checking)->fetch(PDO::FETCH_ASSOC);
    if ($result)
    {
        $sql = "SELECT id FROM user WHERE email = ${email}";
        $stmt = $connection->query($sql);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    return[];
}

function saveFeedback(array $feedback): void
{
    $connection = databaseConnection();
    $sql = "INSERT INTO user (name, email, country, gender) VALUES ('${feedback['name']}', '${feedback['email']}', '${feedback['country']}', '${feedback['gender']}')";
    $connection->query($sql);
    $insert_id = $connection->lastInsertId();
    $sql = "INSERT INTO message (message, user_id) VALUES ('${feedback['message']}', '${insert_id}')";
    $connection->query($sql);
}

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
