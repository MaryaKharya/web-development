<?php

require_once "../src/common.inc.php";

if (getRequestMethod() == 'POST') 
{
    feedbacksListPage();
} 
else 
{
    requestPage();
}