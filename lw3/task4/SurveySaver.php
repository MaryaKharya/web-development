<?php

function GETParameter(string $text): ?string
{
    return isset($_GET[$text]) ? (string)$_GET[$text] : null;
}

 function AddData() 
 {
    $firstname = GETParameter('first_name');
    $lastname = GETParameter('last_name');
    $email = GETParameter('email');
    $age = GETParameter('age');
    if ($email)
    {
        $data = "$firstname $lastname $email $age";
        $file = "data/$email.txt";
        file_put_contents($file, $data);
    }
 }
 
 AddData(); 