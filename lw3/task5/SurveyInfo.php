<?php

function getParameter(string $text): ?string
{
    return isset($_GET[$text]) ? (string)$_GET[$text] : null;
}

function showData() 
{
    $firstname = GETParameter('first_name');
    $lastname = GETParameter('last_name');
    $email = GETParameter('email');
    $age = GETParameter('age');
    if (!is_dir("data") && ($email))
    {
        mkdir("data");
    }

    if ($email)
    {
        $data = "$firstname $lastname $email $age";
        $file = "data/$email.txt";
        file_put_contents($file, $data);
    }

    if (!(file_exists($file)))
    {
        echo 'Введен неверный email';
    }
    else
    {
        $keys = ['first_name', 'fast_name', 'email', 'age'];
        $data = file_get_contents($file);
        $data = explode(" ", $data);
        $data = array_combine($keys, $data);
        foreach($data as $key => $value)
        {
            echo "$key: $value<br>";
        }
    }
}

showData(); 
