<?php

function checkingForm()
{
    $validity = [];
    $name = $_POST["name"];
    $email = $_POST["email"];
    $message = $_POST["message"];
    $isNameValidate = preg_match("/^[a-zа-я]+[a-zа-я\s\-]*$/ui", $name);
    $isEmailValidate = filter_var($email, FILTER_VALIDATE_EMAIL);

    if (!$isNameValidate) {
        $validity['name'] = false;
    }
    if (!$isEmailValidate) {
        $validity['email'] = false;
    }
    if (empty($message)) {
        $validity['message'] = false;
    }
    if ($isNameValidate && $isEmailValidate && !(empty($message)))
    {
        $validity['success'] = true;
    }
    return $validity;
}
function sendForm(): void
{
    $validity = json_encode(checkingForm());
    echo $validity;
}

sendForm();
