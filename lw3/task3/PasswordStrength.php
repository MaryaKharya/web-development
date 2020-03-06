<?php

$password = $_GET['password'];
$strength = 0;
$len = strlen($password);
if (preg_match("/^[aA-zZ0-9]+$/", $password))
{
    $n = $len;
    $strength = 4*$n;
    if (preg_match_all( '/[0-9]/', $password, $matches))
    {
        $n = count($matches[0]);
        $strength = $strength+$n*4;
    }
    if (preg_match_all( '/[A-Z]/', $password, $matches))
    {
        $n = count($matches[0]);
        $strength = $strength+(($len-$n)*2);
    }
    if (preg_match_all( '/[a-z]/', $password, $matches))
    {
        $n = count($matches[0]);
        $strength = $strength+(($len-$n)*2);
    }
    if (preg_match("/^[aA-zZ]+$/", $password))
    {
        $strength = $strength-$len;
    }
    if (preg_match("/^[0-9]+$/", $password))
    {
        $strength = $strength-$len;
    }
    foreach (count_chars($password, 1) as $i => $val) 
    {
        $n = $val;
        if ($n > 1)
        {
            $strength = $strength-$n;
        }
    }
    echo $strength;
}
else
{
     echo $strength;
}    