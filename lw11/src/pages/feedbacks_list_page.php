<?php

include '../src/common.inc.php';


function getFeedback(string $email): array
{
    $connection = databaseConnection();
    $email = $connection->quote($email);
    $checking = "SELECT EXISTS (SELECT * FROM user WHERE email = ${email}) AS data";
    $result = $connection->query($checking)->fetch();
    if ($result['data'])
    {
        $sql = "SELECT name, email, country, gender, message FROM user WHERE email = ${email}";
        $stmt = $connection->query($sql);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    return[];
}

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

