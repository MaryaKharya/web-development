<?php

function getParameter(string $text): ?string
{
    return isset($_GET[$text]) ? (string)$_GET[$text] : null;
}

function showData() 
{
    $firstname = getParameter('first_name');
    $lastname = getParameter('last_name');
    $email = getParameter('email');
    $age = getParameter('age');
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
        echo 'email не введен';
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
