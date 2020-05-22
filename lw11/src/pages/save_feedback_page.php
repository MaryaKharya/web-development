<?php

include '../src/common.inc.php';

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

function saveFeedback(array $feedback): void
{
    $connection = databaseConnection();
    $sql = "INSERT INTO user (name, email, country, gender, message) VALUES ('${feedback['name']}', '${feedback['email']}', '${feedback['country']}', '${feedback['gender']}', '${feedback['message']}')";
    $connection->query($sql);
}

function checkingTheForm() 
{
    $feedback = [];
    $name = getPostParameter('name');
    $email = getPostParameter('email');
    $gender = getPostParameter('gender');
    $country = getPostParameter('country');
    $message = getPostParameter('message');

    if (empty($name)) 
    {
        ($feedback['name_error_msg'] = 'Укажите ваше имя');
    }
    if (empty($email)) 
    {
        ($feedback['email_error_msg'] = 'Укажите ваш email');
    }
    if (empty($message)) 
    {
        ($feedback['message_error_msg'] = 'Напишите что-нибудь');
    }
    if ($gender === 'male') 
    {
        $gender = 'Мужской';
    }
    else
    {
        $gender = 'Женский';
    }

    $feedback['name'] = $name;
    $feedback['email'] = $email;
    $feedback['gender'] = $gender;
    $feedback['country'] = $country;
    $feedback['message'] = $message;
    if (!(empty($name)) && !(empty($email)) && !(empty($message))) 
    {
        $loh = getFeedback($email);
        if (!($loh))
        {           
            $feedback['send'] = 'Ваще сообщение отправлено!';
            saveFeedback($feedback);
        }
        else 
        {
            ($feedback['email_error_msg'] = 'Такой email уже существует' );
        }
    }
    else
    {
        $feedback['error'] = 'Заполните форму!';
    }
    renderTemplate('main.tpl.php', $feedback);
}
