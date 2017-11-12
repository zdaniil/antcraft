<?php

$recepient = "sashakobzew@yandex.ua";
$sitename = "antcraft.com.ua";

$firstname = trim($_POST["firstname"]);
$email = trim($_POST["email"]);
$telephone = trim($_POST["telephone"]);

$message = "Имя: $firstname \nТелефон: $telephone \nEmail: $email";

$pagetitle = "Новая заявка с сайта \"$sitename\"";
mail($recepient, $pagetitle, $message, "Content-type: text/plain; charset=\"utf-8\"\n From: $recepient");
?>