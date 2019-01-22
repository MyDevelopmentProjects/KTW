<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!-- set the encoding of your site -->
    <meta charset="utf-8">
    <!-- set the viewport width and initial-scale on mobile devices -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,400italic,700" type="text/css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
          type="text/css">
    <% String mode = "DEV"; %>
    <% if (mode.equals("DEV")) { %>

    <!-- include the site stylesheets -->
    <link rel="stylesheet" href="/css/bootstrap.css" type="text/css" media="all">
    <link rel="stylesheet" href="/css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="/css/colors.css" type="text/css" media="all">
    <link rel="stylesheet" href="/css/jquery.countdown.css" type="text/css">
    <link rel="stylesheet" href="/css/animations.min.css" type="text/css" media="all">
    <link rel="stylesheet" href="/css/datepicker.css" type="text/css" media="all">
    <!-- Bootstrap Dropdown Hover CSS -->
    <link rel="stylesheet" href="/css/animate.min.css" type="text/css" media="all">
    <link rel="stylesheet" href="/css/bootstrap-dropdownhover.min.css" type="text/css" media="all">
    <!-- Fonts CSS -->
    <!-- Range slider CSS -->
    <link rel="stylesheet prefetch" href="/css/jquery-ui.css" type="text/css">
    <!-- flex slider CSS -->
    <link rel="stylesheet" href="/css/flexslider.css" type="text/css">

    <% } else { %>

    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript">window.jQuery || document.write('<script src="/js/jquery-1.11.2.min.js"><\/script>')</script>
    <script type="text/javascript" src="/build/bundle.js"></script>

    <% } %>

</head>
<body>
<!-- main container of all the page elements -->
<div id="wrapper">
    <!-- header -->
    <header id="header">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <strong class="logo"><a href="/"><img src="/images/logo.png" alt="Akhasheni"></a></strong>
                    <!-- main navigation -->
                    <%--<div style="float: left;margin-top: 12px;"  class="langChooser-mob">
                        <a href="/?lang=ka"><img src="/images/ic_georgia.png"></a>
                        <a href="/?lang=en"><img src="/images/ic_united_states_of_america.png"></a>
                        <br>
                        <a href="/?lang=ru"><img src="/images/ic_russia.png"></a>
                        <a href="/?lang=ch"><img src="/images/ic_china.png"></a>
                    </div>--%>
                    <nav class="navbar navbar-default">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false"><span></span>
                            </button>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-left">
                                <li><a href="/"><fmt:message key="main.menu.home" /></a></li>
                                <li><a href="/about"><fmt:message key="main.menu.aboutus" /></a></li>
                                <li><a href="/rooms"><fmt:message key="main.menu.rooms" /></a></li>
                                <li><a href="/conference"><fmt:message key="main.menu.conference" /></a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="/restaurant"><fmt:message key="main.menu.restaurant" /></a></li>
                                <li><a href="/tours"><fmt:message key="main.menu.tours" /></a></li>
                                <li><a href="/gallery"><fmt:message key="main.menu.gallery" /></a></li>
                                <li><a href="/contact"><fmt:message key="main.menu.contact" /></a></li>
                            </ul>
                        </div>
                    </nav>

                </div>
            </div>
        </div>
    </header>
    <!-- banner -->
    <div class="banner" style="height: 430px;
                        background: url(/uploads/banner.jpg);
                        background-size: cover;
                        background-repeat: no-repeat;
                        background-position: center center;"></div>
    <!-- Navigation -->
    <div class="navigation-bar">
        <div class="container">
            <div class="row">
                <div class="col-xs-7">
                    <ol class="breadcrumb">
                        <li><a href="/?lang=ka"><img src="/images/ic_georgia.png" style="width: 22px;"></a></li>
                        <li><a href="/?lang=en"><img src="/images/ic_united_states_of_america.png" style="width: 22px;"></a></li>
                        <li><a href="/?lang=ru"><img src="/images/ic_russia.png" style="width: 22px;"></a></li>
                        <li><a href="/?lang=ch"><img src="/images/ic_china.png" style="width: 22px;"></a></li>
                    </ol>
                </div>
                <div class="col-xs-5">
                    <a href="/rooms" class="link"><fmt:message key="home.top.allrooms"/></a>
                </div>
            </div>
        </div>
    </div>
    <!-- contain main informative part of the site -->
    <main id="main">