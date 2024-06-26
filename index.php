<?php

require 'vendor/autoload.php';

$TEMPLATES_PATH = 'templates/';

$smarty = new Smarty();

$smarty->setTemplateDir($TEMPLATES_PATH);

$smarty->assign('title', 'PHP + Smarty');
$smarty->assign('message', 'Learning a bit about Smarty');
$smarty->assign('formaction', '/Notary');
$smarty->assign("inquirytype", "inquiry-contractor");
$smarty->assign("contractor_surl", "DE-XX-TERMOLINO");
$smarty->assign("slocation", "");
$smarty->assign("sdetail", "");
$smarty->assign("zip", "");
$smarty->assign("city", "");
$smarty->assign("country", "");
$smarty->assign("state", "");

// Breadcrumb Data
$smarty->assign("breadcrumbs", array(
    array("name" => "Home", "url" => "./"),
));

$smarty->assign("breadcrumbTitle", "Online-Forms");
$smarty->assign("breadcrumbDescription", "We would like to implement your request quickly and legally. For this we need some information from you. The best way to do this is to use our forms. This ensures that we receive all the necessary data. We are happy to clarify any open questions by telephone or in a meeting.");

$smarty->assign("readonly", false);

$forms = array(
    array('title' => 'Buying Real Estate', "image" => "images/realestate.png", "url" => "./form-real-estate.php"),
    array('title' => 'Transfer', "image" => "images/donation.png", "url" => "./form-online-transfer.php"),
    array('title' => 'Starting a business', "image" => "images/business.png", "url" => "./form-starting-business.php"),
    array("title" => "Share purchase", "image" => "images/shares.png", "url" => "./form-share-purchase.php"),
    array("title" => "Inheritance certificate application", "image" => "images/inheritance.png", "url" => "./form-inheritance-certificate.php"),
);

$smarty->assign("forms", $forms);

$smarty->display('index.tpl');
