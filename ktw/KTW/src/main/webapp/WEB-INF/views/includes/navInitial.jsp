<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<div data-ix="nav-initial" class="nav-bar w-clearfix">
    <a href="/" class="logo w-inline-block">
        <img src="/images/header_logo.svg">
    </a>
    <div class="lang-wrapper w-hidden-medium w-hidden-small w-hidden-tiny">
        <%@include file="langChooser.jsp" %>
    </div>
    <div class="nav-top-menu w-clearfix w-hidden-small w-hidden-tiny">
        <a href="/contact" class="nav-link-block w-inline-block">
            <div><fmt:message key="home.menu.contacts"/></div>
        </a>
        <div data-hover="1" data-delay="300" class="nav-link-drop w-dropdown">
            <div class="nav-link-drop-toggle w-clearfix w-dropdown-toggle">
                <a href="/company" class="nav-link-block w-inline-block">
                    <div><fmt:message key="home.menu.company"/></div>
                </a>
            </div>
            <nav data-ix="dropdown" class="drop-bg menu-company w-dropdown-list">
                <a href="/factory"
                   class="drop-menu-link w-dropdown-link"><fmt:message key="home.menu.factory"/></a>
                <a href="/shops" class="drop-menu-link w-dropdown-link"><fmt:message
                        key="home.menu.shops"/></a>
            </nav>
        </div>
        <a href="/cellars" class="nav-link-block w-inline-block">
            <div><fmt:message key="home.menu.cellars"/></div>
        </a>
        <a href="/story" class="nav-link-block w-inline-block">
            <div><fmt:message key="home.menu.story"/></div>
        </a>
        <div data-hover="1" data-delay="300" class="nav-link-drop w-dropdown">
            <div class="nav-link-drop-toggle w-clearfix w-dropdown-toggle">
                <a href="/categories" class="nav-link-block w-inline-block">
                    <div><fmt:message key="home.menu.assortment"/></div>
                </a>
            </div>
            <%@include file="dropdown.jsp" %>
        </div>
    </div>
    <a href="#" data-ix="m-menu-show-trigger" class="m-menu-btn w-inline-block">
        <div class="menu-icon-wrapper">
            <img src="/images/ic-menu_white.svg">
        </div>
        <div class="menu-label w-hidden-tiny">Menu</div>
    </a>
</div>