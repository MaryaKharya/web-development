<?php

header("Content-Type: text/plain");
if ($_GET['identifier'])
{
    $ident = $_GET['identifier'];
    $letter = $ident{0};
    echo "Does the string match the identifier? "; 
    if (preg_match("/^[aA-zZ0-9]+$/",$ident)) 
    {
        if (preg_match('/[a-zA-Z]/', $letter))
        { 
            echo "Yes, first symbol is a letter and string contains only numbers and letters." ;
        }
        else
        {  
            echo "No, first symbol is a number.";
        }  
    }                                     
    else
    {
        echo "No, string contains other symbols. ";
    }
}                       
?>