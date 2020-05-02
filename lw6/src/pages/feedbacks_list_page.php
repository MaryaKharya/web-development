<?php

function feedbacksListPage() {
    $email = getPostParameter('email');
    $feedback['email'] = $email;

    $file = ("../data/" . mb_strtolower($email) . ".txt");
    if (!(file_exists($file))) 
    {
        $feedback['error_msg'] = 'Отправитель не найден';
        renderTemplate('feedbacks.tpl.php', $feedback);
        return;
    }

    $data = file_get_contents("$file");
    $feedback['answers'] = explode(",", $data);

    renderTemplate('feedbacks.tpl.php', $feedback);
}

function requestPage(): void
{
    renderTemplate('feedbacks.tpl.php');
}