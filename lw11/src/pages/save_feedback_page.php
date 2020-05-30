<?php

include '../src/common.inc.php';

function saveFeedback(array $feedback): void
{
    $connection = databaseConnection();
    $sql = "INSERT INTO user (name, email, country, gender) VALUES ('${feedback['name']}', '${feedback['email']}', '${feedback['country']}', '${feedback['gender']}')";
    $connection->query($sql);
    $a = getFeedbacks($email);
    $sqll = "INSERT INTO message (message, user_id) VALUES ('${feedback['message']}', '${insert_id}')";
    $connection->query($sqll);
}

function message(array $feedback): void
{
    $connection = databaseConnection();
    $email = getPostParameter('email');
    $array = getFeedbackId($email);
    $sqll = "UPDATE message SET message=CONCAT(message, ' ${feedback['message']}') WHERE user_id=${array['id']}";
    $connection->query($sqll);
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
        $checkemail = getFeedback($email);
        if (!($checkemail))
        {           
            $feedback['send'] = 'Ваще сообщение отправлено!';
            saveFeedback($feedback);
        }
        else 
        {
            message($feedback);
            $feedback['send'] = 'Сообщение добавлено!';
        }
    }
    else
    {
        $feedback['error'] = 'Заполните форму!';
    }
    renderTemplate('main.tpl.php', $feedback);
}
