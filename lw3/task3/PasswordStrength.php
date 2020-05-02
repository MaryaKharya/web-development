<?php

if ($_GET['password'])
{
    $password = $_GET['password'];
    $strength = 0;
    $len = strlen($password);
    if (preg_match("/^[aA-zZ0-9]+$/", $password))
    {
        $strength = 4*$len;
        if (preg_match_all( '/[0-9]/', $password, $matches))
        {
            $n = count($matches[0]);
            $strength += $n*4;
        }
        if (preg_match_all( '/[A-Z]/', $password, $matches))
        {  
            $n = count($matches[0]);
            $strength += ($len-$n)*2;
        }
        if (preg_match_all( '/[a-z]/', $password, $matches))
        {
            $n = count($matches[0]);
            $strength += ($len-$n) * 2;
        }
        if (preg_match("/^[aA-zZ]+$/", $password))
        {
            $strength -= $len;
        }
        if (preg_match("/^[0-9]+$/", $password))
        {
            $strength -= $len;
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
}   
