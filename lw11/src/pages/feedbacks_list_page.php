<?php

include '../src/common.inc.php';


function feedbacksListPage(): void 
{
    $email = getPostParameter('email');
    if (!(getFeedback($email))) 
    {
        $feedback['error_msg'] = 'Отправитель не найден';
    }
    else
    {
        $feedback['answers'] = getFeedback($email);
    }
    renderTemplate('feedbacks.tpl.php', $feedback);
}

function requestPage(): void
{
    renderTemplate('feedbacks.tpl.php');
}

