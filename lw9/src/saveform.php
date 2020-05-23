<?php

function checkingForm($check): array
{
    $validity = [];
    $isNameValidate = preg_match("/^[a-zа-я]+[a-zа-я\s\-]*$/ui", $check['name']);
    $isEmailValidate = filter_var($check['email'], FILTER_VALIDATE_EMAIL);

    if (!$isNameValidate) {
        $validity['name'] = true;
    }
    if (!$isEmailValidate) {
        $validity['email'] = true;
    }
    if ($isNameValidate && $isEmailValidate)
    {
        $validity['success'] = true;
    }
    return $validity;
}
function sendForm(): void
{
    $check = file_get_contents('php://input');
    $check = json_decode($check, true);
    $validity = checkingForm($check);
    $validity = json_encode($validity);
    echo $validity;
}

sendForm();

