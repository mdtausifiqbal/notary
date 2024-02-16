<!DOCTYPE html>
<html dir="ltr" lang="de-DE" xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />

    <meta http-equiv="content-language" content="de" />
    <meta http-equiv="expires" content="1209600" />
    <meta name="revisit-after" content="7 days" />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="copyright" content="Copyright 2024 by FALCO. All rights reserved worldwide." />
    <meta name="keywords" lang="de" content="Notar, Termin, sofort" />
    <meta name="description" lang="de" content="Schnell und einfach einen Notartermin in Ihrer Nähe vereinbaren" />

    <title>{block title}TERMOLINO - Notarsuche Terminanfrage{/block}</title>

    <!--[if IE
      ]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"
    /><![endif]-->

    <!-- Favicons -->
    <link type="image/x-icon" href="images/favicon.png" rel="icon" />

    <!-- Bootstrap CSS -->
    {* <link rel="stylesheet" href="css/bootstrap.min.css" /> *}
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <link rel="stylesheet" href="css/all.min.css" />

    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/custom.css" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="/assets/js/html5shiv.min.js"></script>
      <script src="/assets/js/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
</head>

<body>
    <!-- Main Wrapper -->
    <div class="main-wrapper">
        <!-- Header -->
        {include file="header.tpl"}
        <!-- /Header -->

        <!-- Breadcrumb -->
        {include file="breadcrumb.tpl"}
        <!-- /Breadcrumb -->

        <!-- Page Content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        {block "content"}

                        {/block}
                    </div>
                </div>
            </div>
        </div>
        <!-- /Page Content -->

        <!-- Footer -->
        {include file="footer.tpl"}
        <!-- /Footer -->
    </div>
    <!-- /Main Wrapper -->

    <!-- Bootstrap Core JS -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!-- Sticky Sidebar JS -->
    <!-- 4 Blog -->
    <script src="js/ResizeSensor.js"></script>
    <script src="js/theia-sticky-sidebar.js"></script>

    <!-- Slick JS -->
    <!-- 4 Start -->
    <script src="js/slick.js"></script>

    <!-- Custom JS -->
    <script src="js/script.js"></script>

    {block "scripts"}
    {/block}
</body>

</html>