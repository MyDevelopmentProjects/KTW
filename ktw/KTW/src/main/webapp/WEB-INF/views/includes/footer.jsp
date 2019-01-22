<div class="black footer-section">
    <div class="footer-wide-block w-clearfix">
        <div class="link-col-wrapper w-clearfix">
            <div class="footer-link-col">
                <a href="categories.html" class="footer-link"><fmt:message key="home.menu.assortment"/></a>
                <a href="cellars.html" class="footer-link"><fmt:message key="home.menu.cellars"/></a>
            </div>
            <div class="footer-link-col">
                <a href="company.html" class="footer-link">
                    <fmt:message key="home.menu.company"/>
                </a>
                <a href="story.html" class="footer-link">
                    <fmt:message key="home.menu.story"/>
                </a>
            </div>
            <div class="footer-link-col">
                <a href="contacts.html" class="footer-link">
                    <fmt:message key="home.menu.contacts"/>
                </a>
            </div>
        </div>
        <div class="footer-logo"><img src="/images/bottom_logo.svg"></div>
    </div>
    <div class="under-wide-footer w-clearfix">
        <div class="fl-right under-footer-label">
            <fmt:message key="home.footer.ktw"/>
        </div>
        <a target="_blank" href="https://appload.ge" class="under-footer-label">Design by AppLoad.GE</a>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js" type="text/javascript"></script>
<script src="/js/webflow.js" type="text/javascript"></script>
<!-- [if lte IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
<script type="text/javascript">
    $('.m-menu-btn').click(function(e) {
        e.preventDefault();
        $('body').css('overflow', 'hidden');
    });
    $('.close-block').click(function(e) {
        e.preventDefault();
        $('body').css('overflow', 'auto');
    });
</script>
</body>
</html>