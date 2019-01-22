<div data-ix="video-section" class="main-section video">
    <div data-poster-url="videos/videoBG.png"
         data-video-urls="videos/mainvideo.webm"
         data-autoplay="true"
         data-loop="true"
         data-wf-ignore="true"
         class="background-video w-background-video w-background-video-atom">
        <video autoplay="" loop="" style="background-image:url(videos/videoBG.png);"
               data-wf-ignore="true" controls="false" muted>
            <source src="videos/mainvideo.webm" data-wf-ignore="true">
            <%--<source src="videos/mainvideo.mp4" data-wf-ignore="true">--%>
        </video>
    </div>
    <div data-ix="center-logo-initial" class="center-video-logo"><img src="images/large_logo.svg"></div>
    <%@include file="../includes/nav.jsp" %>
</div>
<div data-ix="float-menu-show" class="menu-show-container">
    <div data-ix="light-wide-section" id="ls" class="light-wide-section">
        <div class="text-container">
            <h2 data-ix="move-down-30" class="h2" style="color: #fff;">
                <fmt:message key="main.slide.title"/>
            </h2>
            <p data-ix="move-down-30" class="paragraph" style="color: #fff;">
                <fmt:message key="main.slide.desc"/>
            </p><a href="/categories" data-ix="move-down-30" class="button w-button" style="color: #fff;">
            <fmt:message key="home.see.assortment"/></a>
        </div>
    </div>
    <div data-ix="img-grid-section-scroll" class="img-grid-section w-clearfix">

        <style>
            .sunrise-section {
                background-position: 50% 50% !important;
                background-size: cover !important;
            }
        </style>

        <div class="col-grid-1st w-clearfix">
            <div data-ix="opacity-0" class="animate-wrap-1st w-clearfix">
                <a href="/categories" data-ix="2-line-hover-anmation" class="large-img w-inline-block">
                    <div class="img-wide-wrap"
                         style="height: 470px;background: url(uploads/homepage2.jpg);background-size: cover;background-position: center center;">
                        <img width="969" class="full-width-img">
                        <div class="dark-cover"></div>
                        <div class="label-block">
                            <div class="label-container">
                                <div class="two-line-img"></div>
                                <div><fmt:message key="home.discover.ktw.wines"/></div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="row-wrapper w-clearfix">
                <div class="haf-col">
                    <div data-ix="opacity-0" class="animate-wrap-2nd w-clearfix">
                        <a href="/company" data-ix="2-line-hover-anmation" class="short-image w-inline-block">
                            <div class="img-short-wrap"
                                 style="height: 470px;background: url(images/bochkebi.png);background-size: cover;background-position: center center;">
                                <img width="481" class="full-width-img">
                                <div class="dark-cover"></div>
                                <div class="label-block">
                                    <div class="label-container">
                                        <div class="two-line-img"></div>
                                        <div><fmt:message key="home.georgia"/></div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="haf-col">
                    <div data-ix="opacity-0" class="animate-wrap-3rd w-clearfix">
                        <a href="/cellars" data-ix="2-line-hover-anmation" class="short-image w-inline-block">
                            <div class="img-short-wrap"
                                 style="height: 470px;background: url(images/guramishvili.png);background-size: cover;background-position: center center;">
                                <img width="481" class="full-width-img">
                                <div class="dark-cover"></div>
                                <div class="label-block two-row">
                                    <div class="label-container">
                                        <div class="two-line-img"></div>
                                        <div><fmt:message key="home.guramishvili.marani"/></div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-grid-2nd">
            <div class="m-half-col">
                <div data-ix="opacity-0" class="animate-wrap-2nd w-clearfix">
                    <a href="/story" data-ix="2-line-hover-anmation" class="short-image w-inline-block">
                        <div class="img-short-wrap"
                             style="height: 470px;background: url(images/winey.png);background-size: cover;background-position: center center;">
                            <img width="481" class="full-width-img">
                            <div class="dark-cover"></div>
                            <div class="label-block">
                                <div class="label-container">
                                    <div class="two-line-img"></div>
                                    <div><fmt:message key="home.vinery"/></div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="m-half-col">
                <div data-ix="opacity-0" class="animate-wrap-4th w-clearfix">
                    <a href="/categories" data-ix="2-line-hover-anmation" class="short-image w-inline-block">
                        <div class="img-short-wrap"
                             style="height: 470px;background: url(images/champg.png);background-size: cover;background-position: center center;">
                            <img width="481" class="full-width-img">
                            <div class="dark-cover"></div>
                            <div class="label-block">
                                <div class="label-container">
                                    <div class="two-line-img"></div>
                                    <div><fmt:message key="home.champaigne"/></div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div data-ix="grape-section" class="grape-section">
        <div class="discription-container">
            <div data-ix="seaator-top" class="separator-top"><img src="images/sep_top_1.svg"></div>
            <div class="discription-wrapper">
                <div data-ix="move-down-30" class="discription-text">
                    <fmt:message key="home.about.text"/>
                </div>
                <a href="/company" data-ix="move-down-30" class="discrioption-block link-block w-inline-block">
                    <div class="pressed-lines"></div>
                    <div><fmt:message key="home.learn.more.about.company"/></div>
                </a>
            </div>
            <div data-ix="separator-bottom" class="separator-bottom"><img src="images/sep_bottom.svg"></div>
        </div>
    </div>
    <div data-ix="sunrise-section" class="sunrise-section">
        <div class="sunrise-text-block">
            <h2 data-ix="move-down-30" class="h2" style="color: #FFF;">
                <fmt:message key="home.see.all.ass.title"/>
            </h2>
            <p data-ix="move-down-30" class="p sunrice-section" style="color: white">
                <fmt:message key="home.see.all.ass.desc"/>
            </p>
            <a href="/company"
               data-ix="move-down-30"
               class="button w-button" style="color: white">
                <fmt:message key="home.see.all.assortment"/>
            </a>
        </div>
    </div>
</div>
<div data-ix="contact-section" class="contact-section">
    <div class="contacts-container w-container">
        <div class="contacts-block">
            <h1 data-ix="move-down-30" class="contacts"><fmt:message key="home.contacts"/></h1>
            <div data-ix="move-down-30" class="contact-row-block">
                <div class="contact-heading-label"><fmt:message key="home.contacts.address"/></div>
                <div class="contact-label">12 S. Tsintsadze St., 0160 Tbilisi, Georgia <span
                        class="dark-grey">(fact.)</span></div>
                <div class="contact-label">12 Ksani St., Tbilisi, Georgia <span class="dark-grey">(jur.)</span></div>
            </div>
            <div class="contact-row-block">
                <div data-ix="move-down-30" class="phone-col-wrap w-clearfix">
                    <div class="phone-col">
                        <div class="contact-heading-label"><fmt:message key="home.contacts.fax.phone"/></div>
                        <a href="#" class="contact-label underline">+995 32 223 77 22</a></div>
                    <div class="phone-col">
                        <div class="contact-heading-label"><fmt:message key="home.contacts.phone"/></div>
                        <a href="#" class="contact-label underline">+995 32 223 77 00</a></div>
                </div>
            </div>
            <div data-ix="move-down-30" class="contact-row-mail">
                <div class="contact-heading-label"><fmt:message key="home.contacts.email"/></div>
                <a href="mailto:info@ktw.ge" class="contact-label underline">info@ktw.ge</a></div>
        </div>
    </div>
    <div class="contacts-bg w-hidden-tiny"></div>
</div>
