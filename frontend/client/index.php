<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>TheFace</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Place favicon.ico in the root directory -->
    <link href="assets/images/favicon.ico" type="img/x-icon" rel="shortcut icon">
    <!-- All css files are included here. -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/iconfont.min.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/helper.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <script src="shared/scripts/app.js"></script>
    <script src="shared/scripts/init.js"></script>
</head>

<body>

    <div id="main-wrapper">

        <!--Header section start-->
        <header class="header header-transparent header-sticky"></header>
        <!--Header section end-->

        <!-- main body start -->
        <?php
        $page = isset($_GET['page']) ? $_GET['page'] : 'home';
        $page_path = "pages/$page/$page";
        if (file_exists("$page_path.html")) {
            include_once("$page_path.html");
        } else {
            header("Location: shared/components/404.html");
        }
        echo "<script src='pages/$page/$page.js'></script>";
        ?>
        <!-- main body end -->

        <!--Footer section start-->
        <footer class="footer-section section bg-dark"></footer>
        <!--Footer section end-->

    </div>

    <!-- Placed js at the end of the document so the pages load faster -->

    <!-- All jquery file included here -->
    <script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
    <script src="assets/js/vendor/jquery-3.6.0.min.js"></script>
    <script src="assets/js/vendor/jquery-migrate-3.3.2.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>

</body>

</html>