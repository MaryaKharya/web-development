<?php

header("Content-Type: text/plain");
$ident = $_GET['identifier'];
$letter = $ident{0}; 
if (preg_match("/^[aA-zZ0-9]+$/",$ident)) 
{
    if (preg_match('/[a-zA-Z]/', $letter))
    {
        echo 'Yes, first symbol is a letter and string contains only numbers and letters.' ;
    }
    else
    {  
        echo 'No, first symbol is a number.';
    }
}                                     
else
{
   echo "No, string contains other symbols. ";
}                       
?>