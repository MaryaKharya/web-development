<?php

include '../src/common.inc.php';


function message(array $feedback): void
{
    $connection = databaseConnection();
    $email = getPostParameter('email');
    $array = getFeedbackId($email);
    $sql = "INSERT INTO message (message, user_id) VALUES ('${feedback['message']}', '${array['id']}')";
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
