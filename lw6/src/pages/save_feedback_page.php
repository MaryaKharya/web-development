<?php

function checkingTheForm() 
{
    $feedback = [];
    $name = getPostParameter('name');
    $email = getPostParameter('email');
    $gender = getPostParameter('gender');
    $country = getPostParameter('country');
    $message = getPostParameter('message');

    if (!(empty($name)) && !(empty($email)) && !(empty($message))) 
    {
        $feedback['send'] = 'Ваще сообщение отправлено!';
    }
    if ((empty($name)) || (empty($email)) || (empty($message))) 
    {
        $feedback['error'] = 'Заполните форму!';
    }
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

    
    $data = [
        "$name, $email , $country , $gender , $message"
    ];

    $file = "../data/" . mb_strtolower($email) . ".txt";
    file_put_contents($file, $data);

    renderTemplate('main.tpl.php', $feedback);
}