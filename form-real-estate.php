<?php

require "./template.php";

$smarty = new Template();

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
    array("name" => "Buying Real Estate", "url" => ""),
));

$smarty->assign("breadcrumbTitle", "Buying Real Estate");
$smarty->assign("breadcrumbDescription", "We would like to implement your request quickly and legally. For this we need some information from
you. You are welcome to use our online form for this. To send your entries to us, please click on “Send
form to notary”. You also have the option of temporarily saving your entries and completing the form at
a later date. Forwarding to other people for further completion is also possible. We are of course happy
to answer any questions you may have, by telephone or in a personal meeting.");

$smarty->assign("readonly", false);

$smarty->assign("files", '[{"name":"business.png","url":"images/business.png","size":4194304,"createdAt":1711732902804,"createdBy":"Client"},{"name":"search.png","url":"images/search.png","size":4104304,"createdAt":1711732984638,"createdBy":"Client"}]');

$smarty->display('forms/content-form-realestate.tpl');
