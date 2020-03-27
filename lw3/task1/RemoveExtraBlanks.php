<?php

header("Content-Type: text/plain");
if ($_GET['text'])
{
    $name = $_GET['text'];
    $name = trim($name, ' ');
    $length = strlen($name);
    for ($i = 0; $i < $length; $i++)
    {
        $name = str_replace("  ", " ", $name);
    }
    echo $name;
}
     