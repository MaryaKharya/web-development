<?php

function getParameter(string $text): ?string
{
    return isset($_GET[$text]) ? (string)$_GET[$text] : null;
}

function showData() 
{
    $email = getParameter('email');

    if ($email)
    {
        $file = "data/$email.txt";
    }

    if (!(file_exists($file)))
    {
        echo 'email не существует';
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
