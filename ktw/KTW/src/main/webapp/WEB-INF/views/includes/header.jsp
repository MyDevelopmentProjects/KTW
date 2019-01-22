<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- This site was created in Webflow. http://www.webflow.com -->
<!-- Last Published: Mon Oct 30 2017 19:50:57 GMT+0000 (UTC) -->
<html data-wf-page="59539e965962c342ed25348e" data-wf-site="59539e965962c342ed25348d">
<head>
    <meta charset="utf-8">
    <title>${empty pageTitle ? 'title.home' : pageTitle}</title>
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="/css/normalize.css" rel="stylesheet" type="text/css">
    <link href="/css/webflow.css" rel="stylesheet" type="text/css">
    <link href="/css/ktw.webflow.css" rel="stylesheet" type="text/css">
    <!-- [if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"
            type="text/javascript"></script><![endif] -->
    <script type="text/javascript">!function (o, c) {
        var n = c.documentElement, t = " w-mod-";
        n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch")
    }(window, document);</script>
    <link href="/images/fav.png" rel="shortcut icon" type="image/x-icon">
    <link href="/images/clip.png" rel="apple-touch-icon">
    <style>
        .red-line:first-letter {
            font-family: Source Serif Pro;
            font-size: 52px;
            line-height: 40px;
            float: left;
            color: #9E305B;
            color: rgb(158, 48, 91);
            font-weight: 300;
            padding: 4px 12px 0 0;
        }

        @media (max-width: 1210px) {
            .lang-wrapper {
                margin-left: 20px;
            }

            .language-link {
                padding: 16px 6px 16px 6px;
            }

            .nav-link-block {
                padding: 24px 18px;
            }
        }

        @media (max-width: 991px) {
            .nav-link-block {
                padding-right: 12px;
                padding-left: 12px;
            }
        }

        ul, ol {
            margin-top: 0;
            padding-left: 26px;
        }

        li {
            list-style: none;
            position: relative;
        }

        li:before {
            content: '';
            background: #9e305b;
            display: inline-block;
            width: 6px;
            height: 6px;
            border-radius: 50%;
            position: absolute;
            top: 9px;
            left: -24px;
        }
    </style>
    <style>
        .label-block, .dark-cover {
            pointer-events: none;
        }

        /*-webkit-tap-highlight-color:rgba(0,0,0,0);*/
    </style>
</head>
<body>
<div data-ix="m-menu-conainer-initial" class="m-menu-container">
    <div data-ix="m-menu-wrapper-initial" class="m-menu-wrapper">
        <div data-ix="m-menu-close-trigger" class="close-block">
            <div class="close-btn-wrapper">
                <div class="close-icn-wrapper"><img src="/images/close_white.svg"></div>
                <div class="close-menu-label">close menu</div>
            </div>
        </div>
        <div class="m-links-menu w-clearfix">
            <div data-ix="m-nav-link-initial" class="m-animate-1">
                <a href="/categories" class="m-nav-link w-inline-block">
                    <div>
                        <fmt:message key="home.menu.assortment"/>
                    </div>
                </a>
            </div>
            <div data-ix="m-nav-link-initial" class="m-animate-2">
                <a href="/story" class="m-nav-link w-inline-block">
                    <div>
                        <fmt:message key="home.menu.story"/>
                    </div>
                </a>
            </div>
            <div data-ix="m-nav-link-initial" class="m-animate-3">
                <a href="/company" class="m-nav-link w-inline-block">
                    <div>
                        <fmt:message key="home.menu.company"/>
                    </div>
                </a>
            </div>
            <div data-ix="m-nav-link-initial" class="m-animate-4">
                <a href="/factory" class="m-nav-link w-inline-block">
                    <div>
                        <fmt:message key="home.menu.factory"/>
                    </div>
                </a>
            </div>
            <div data-ix="m-nav-link-initial" class="m-animate-5">
                <a href="/shops" class="m-nav-link w-inline-block">
                    <div>
                        <fmt:message key="home.menu.shops"/>
                    </div>
                </a>
            </div>
            <div data-ix="m-nav-link-initial" class="m-animate-6">
                <a href="/cellars" class="m-nav-link w-inline-block">
                    <div>
                        <fmt:message key="home.menu.cellars"/>
                    </div>
                </a>
            </div>
            <div data-ix="m-nav-link-initial" class="m-animate-7">
                <a href="/contact" class="m-nav-link w-inline-block">
                    <div>
                        <fmt:message key="home.menu.contacts"/>
                    </div>
                </a>
            </div>
            <div class="lang-wrapper">
                <%@include file="langChooser.jsp" %>
            </div>
        </div>
    </div>
</div>
<div data-ix="float-menu-initial" class="floating-nav-bar w-clearfix">
    <a href="/" class="logo w-inline-block">
        <img src="/images/header_logo.svg">
    </a>
    <div class="nav-top-menu w-clearfix w-hidden-small w-hidden-tiny">
        <a href="/contact" class="nav-float-link w-inline-block">
            <div><fmt:message key="home.menu.contacts"/></div>
        </a>
        <div data-hover="1" data-delay="300" class="nav-link-drop w-dropdown">
            <div class="nav-link-drop-toggle w-clearfix w-dropdown-toggle">
                <a href="/company" class="nav-link-block w-inline-block">
                    <div><fmt:message key="home.menu.company"/></div>
                </a>
            </div>
            <nav data-ix="dropdown" class="drop-bg menu-company w-dropdown-list">
                <a href="/factory" class="drop-menu-link w-dropdown-link">
                    <fmt:message key="home.menu.factory"/>
                </a>
                <a href="/shops" class="drop-menu-link w-dropdown-link">
                    <fmt:message key="home.menu.shops"/>
                </a>
            </nav>
        </div>
        <a href="/cellars" class="nav-float-link w-inline-block">
            <div>
                <fmt:message key="home.menu.cellars"/>
            </div>
        </a>
        <a href="/story" class="nav-float-link w-inline-block">
            <div><fmt:message key="home.menu.story"/></div>
        </a>
        <div data-hover="1" data-delay="300" class="dropdown w-dropdown">
            <div class="nav-float-drop-toggle w-clearfix w-dropdown-toggle">
                <a href="/categories" class="nav-float-link w-inline-block">
                    <div><fmt:message key="home.menu.assortment"/></div>
                </a>
            </div>
            <%@include file="dropdown.jsp" %>
        </div>
    </div>
    <a href="#" data-ix="m-menu-show-trigger" class="m-menu-btn w-inline-block">
        <div class="menu-icon-wrapper"><img src="/images/ic-menu_white.svg"></div>
        <div class="float menu-label w-hidden-tiny">Menu</div>
    </a>
</div>