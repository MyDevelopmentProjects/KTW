</main>
<!-- footer of the page -->
<div class="b-container">
    <div class="footer-nav">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <a href="#wrapper" class="go-top">
                        <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>
                    </a>
                    <strong class="logo"><a href="/"><img src="/images/f-logo.png" alt="Hotel"></a></strong>
                    <!-- footer navigation -->
                    <nav class="f-nav">
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
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <p>&copy; <a href="#" class="link">Akhasheni</a>. <fmt:message key="footer.cr" /> <a href="#">AppLoad.GE</a>
                    </p>
                </div>
                <div class="col-sm-6">
                    <ul class="list-inline social-networks">
                        <li><a href="#"><span class="icon-facebook"></span></a></li>
                        <li><a href="#"><span class="icon-twitter"></span></a></li>
                        <li><a href="#"><span class="icon-youtube"></span></a></li>
                        <li><a href="#"><span class="icon-instagram"></span></a></li>
                        <li><a href="#"><span class="icon-google"></span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</div>
</div>

<% if (mode.equals("DEV")) { %>

<!-- include jQuery library -->
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">window.jQuery || document.write('<script src="/js/jquery-1.11.2.min.js"><\/script>')</script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<!-- Range Slider JavaScript -->
<script type="text/javascript" src='/js/jquery-ui.min.js'></script>
<script type="text/javascript" src='/js/range-slider.js'></script>
<!-- Same Height JavaScript -->
<script type="text/javascript" src='/js/same-height.js'></script>
<!-- include custom JavaScript -->
<script type="text/javascript" src="/js/jquery.main.js"></script>
<script type="text/javascript" src="/js/animations.min.js"></script>
<script type="text/javascript" src="/js/jquery.plugin.js"></script>
<script type="text/javascript" src="/js/jquery.countdown.js"></script>
<script type="text/javascript" src="/js/timber.master.min.js"></script>
<!-- Bootstrap Dropdown Hover JS -->
<script type="text/javascript" src="/js/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" defer src="/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="/js/myscript.js"></script>

<% } %>

</body>
</html>
