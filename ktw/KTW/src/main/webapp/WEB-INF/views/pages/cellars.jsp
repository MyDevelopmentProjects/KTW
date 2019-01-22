<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<jsp:include page="../includes/nav.jsp">
    <jsp:param name="className" value="main-section assortment active"/>
    <jsp:param name="headingText" value="${headingTitle}"/>
    <jsp:param name="headingDesc" value="${headingDesc}"/>
</jsp:include>
<div data-ix="float-menu-show" class="content-section g-marani">
    <div class="gm-block w-container">
        <div class="cofw-container">
            <h3><fmt:message key="cellars.first.section.title"/></h3>
            <div class="content-wrapper w-clearfix">
                <p class="content-p red-line">
                    <fmt:message key="cellars.first.section.desc1"/>
                </p>
                <div class="block-quote">
                    <div class="bq-wrapper">
                        <div class="bottom separetor"></div>
                        <div class="separetor"></div>
                        <p class="bq-text">
                            <fmt:message key="cellars.first.section.desc2"/>
                        </p>
                    </div>
                </div>
                <p class="content-p">
                    <fmt:message key="cellars.first.section.desc3"/>
                </p>
                <p class="content-p">
                    <fmt:message key="cellars.first.section.desc4"/>
                </p>
            </div>
        </div>
    </div>
    <div class="room-section">
        <div class="room-bg room-bg-0"></div>
        <div class="room-about-container w-clearfix">
            <div class="room-discription-block">
                <div class="room-separator-container"><img src="images/sep.svg" width="52"></div>
                <p class="content-p red-line" style="font-size: 13px;">
                    <fmt:message key="cellars.second.section.desc1"/>
                </p>
            </div>
        </div>
    </div>
    <div class="room-section">
        <div class="room-bg room-bg-1"></div>
        <div class="room-about-container w-clearfix">
            <div class="right room-discription-block">
                <div class="room-separator-container"><img src="images/sep.svg" width="52"></div>
                <p class="content-p red-line" style="font-size: 13px;">
                    <fmt:message key="cellars.second.section.desc2"/>
                </p>
            </div>
        </div>
    </div>
    <div class="room-section">
        <div class="room-bg room-bg-2"></div>
        <div class="room-about-container w-clearfix">
            <div class="room-discription-block">
                <div class="room-separator-container"><img src="images/sep.svg" width="52"></div>
                <p class="content-p red-line" style="font-size: 13px;">
                    <fmt:message key="cellars.second.section.desc3"/>
                </p>
            </div>
        </div>
    </div>
    <div class="floor-section">
        <div class="floor-container w-container">
            <div class="floor-discription-container">
                <h3 class="white-heading">
                    <fmt:message key="cellars.third.section.title"/>
                </h3>
                <div class="floor-doscription">
                    <p class="white-p">
                        <fmt:message key="cellars.third.section.desc1"/>
                    </p>
                </div>
            </div>
            <div class="tab-block">
                <div data-duration-in="600" data-duration-out="400" class="tab-container w-tabs">
                    <div class="tab-menu w-tab-menu">
                        <a data-w-tab="Third" data-ix="3rg-floor" class="tab-link w-inline-block w-tab-link">
                            <div><fmt:message key="cellars.fourth.section.title4"/></div>
                        </a>
                        <a data-w-tab="Second" data-ix="2nd-floor" class="tab-link w-inline-block w-tab-link">
                            <div><fmt:message key="cellars.fourth.section.title3"/></div>
                        </a>
                        <a data-w-tab="Ground" data-ix="1st-floor" class="tab-link w-inline-block w-tab-link">
                            <div><fmt:message key="cellars.fourth.section.title2"/></div>
                        </a>
                        <a data-w-tab="Basement" data-ix="0-floor"
                           class="tab-link w--current w-inline-block w-tab-link">
                            <div><fmt:message key="cellars.fourth.section.title1"/></div>
                        </a>
                    </div>
                    <div class="tabs-content w-tab-content">
                        <div data-w-tab="Third" class="w-tab-pane">
                            <div class="w-clearfix white-quote-container">
                                <div data-ix="bq-tab-show" class="white-quote">
                                    <div class="bq-wrapper">
                                        <div class="bottom separator-white-bq"></div>
                                        <div class="separator-white-bq"></div>
                                        <p class="white-bq-text">
                                            <fmt:message key="cellars.fourth.section.desc4"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-w-tab="Second" class="w-tab-pane">
                            <div class="w-clearfix white-quote-container">
                                <div data-ix="bq-tab-show" class="white-quote">
                                    <div class="white-bq-wrapper">
                                        <div class="bottom separator-white-bq"></div>
                                        <div class="separator-white-bq"></div>
                                        <p class="white-bq-text">
                                            <fmt:message key="cellars.fourth.section.desc3"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-w-tab="Ground" class="w-tab-pane">
                            <div class="w-clearfix white-quote-container">
                                <div data-ix="bq-tab-show" class="white-quote">
                                    <div class="bq-wrapper">
                                        <div class="bottom separator-white-bq"></div>
                                        <div class="separator-white-bq"></div>
                                        <p class="white-bq-text">
                                            <fmt:message key="cellars.fourth.section.desc2"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div data-w-tab="Basement" class="w--tab-active w-tab-pane">
                            <div class="w-clearfix white-quote-container">
                                <div data-ix="bq-tab-show" class="white-quote">
                                    <div class="bq-wrapper">
                                        <div class="bottom separator-white-bq"></div>
                                        <div class="separator-white-bq"></div>
                                        <p class="white-bq-text">
                                            <fmt:message key="cellars.fourth.section.desc1"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ktw-offce-container w-hidden-small w-hidden-tiny">
                    <div class="ktw-office-bg"><img src="images/ktw_bg_2.svg"></div>
                    <div data-ix="opacity-0" class="_3rd-floor"><img src="images/3rd.svg"></div>
                    <div data-ix="opacity-0" class="_2nd-floor"><img src="images/2nd.svg"></div>
                    <div data-ix="opacity-0" class="_1st-floor"><img src="images/1st.svg"></div>
                    <div data-ix="opacity-0" class="_0-floor"><img src="images/0fl_2.svg"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="slider-section-2">
        <div data-animation="slide" data-autoplay-limit="1" data-duration="800" id="slider" class="slider w-slider">
            <div class="slider-mask w-slider-mask">
                <div class="slide-container w-slide"
                     style="background-image: url('/uploads/5a1288402b18680001f1f5f5_Webp.net-resizeimage.jpg');
                            background-position: center center;">
                    <div data-ix="in-slide-discription"
                         class="slide-discription">
                        <div></div>
                    </div>
                </div>
                <div class="slide-container w-slide"
                     style="background-image: url('/uploads/chamber-min.jpg');
                            background-position: center center;">
                    <div data-ix="in-slide-discription"
                         class="slide-discription">
                        <div></div>
                    </div>
                </div>
                <div class="slide-container w-slide"
                     style="background-image: url('/uploads/img_1696_16743-min.jpg');
                            background-position: center center;">
                    <div data-ix="in-slide-discription"
                         class="slide-discription">
                        <div></div>
                    </div>
                </div>
            </div>
            <div data-ix="slider-arrow-hover-left" class="slider-arrow w-slider-arrow-left">
                <div data-w-id="fa69b07e-0ecf-8b68-5923-3e6d8a5aab7e" class="slider-arrow-wrapper"><img
                        src="images/ic_slide-arrow_left_wt.svg"></div>
            </div>
            <div data-ix="slider-arrow-hover-right" data-w-id="0206ed1d-c936-49a5-ecbd-768027a011dd"
                 class="slider-arrow w-slider-arrow-right">
                <div data-w-id="639f202e-96e1-affd-4917-451be2a930b9" class="slider-arrow-right-wrapper"><img
                        src="images/ic_slide-arrow_right_wt.svg"></div>
            </div>
        </div>
    </div>
    <div class="veranda-section">
        <div class="veranda-container w-container">
            <div class="veranda-heading-container">
                <h1 class="h1-content">
                    <fmt:message key="cellars.fifth.section.title1"/>
                </h1>
                <div class="large p-wrapper">
                    <p class="content-p">
                        <fmt:message key="cellars.fifth.section.desc1"/>
                    </p>
                </div>
            </div>
            <div class="img-list-container">
                <div class="slider-col-container">
                    <div class="veranda-slider w-slider">
                        <div class="w-slider-mask">
                            <div class="content-slide w-slide"
                                 style="background-image: url('/uploads/5a128a4c2b18680001f1f6a9_17016867_581047938770161_4202328500651496347_o.jpg')"></div>
                        </div>
                    </div>
                </div>
                <div class="discript-slider-col">
                    <div class="veranda-content-container">
                        <h3 class="h2-veranda"><fmt:message key="cellars.fifth.section.title2"/></h3>
                        <ul>
                            <fmt:message key="cellars.fifth.section.desc2"/>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="offer-section">
        <div class="offer-container w-container">
            <div class="img-list-container">
                <div class="slider-col-container">
                    <div class="veranda-slider w-slider">
                        <div class="w-slider-mask">
                            <div class="content-slide w-slide"
                                 style="background-image: url('/uploads/5a128b052b18680001f1f6d6_12771961_434408476767442_7926085673135728569_o.jpg')"></div>
                        </div>
                    </div>
                </div>
                <div class="discript-slider-col">
                    <div class="veranda-content-container">
                        <h3 class="h2-veranda"><fmt:message key="cellars.fifth.section.title3"/></h3>
                        <fmt:message key="cellars.fifth.section.desc3"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="seasons-section">
    <div class="seasons-container w-container">
        <div class="img-list-container">
            <div class="slider-col-container">
                <div class="veranda-slider w-slider">
                    <div class="w-slider-mask">
                        <div class="content-slide w-slide"
                             style="background-image: url('/uploads/veliscixefirst.jpg')"></div>
                    </div>
                </div>
            </div>
            <%--<div class="discript-slider-col">
                <div class="veranda-content-container">
                    <h3 class="h2-veranda"><fmt:message key="cellars.fifth.section.title4"/></h3>
                    <ul>
                        <fmt:message key="cellars.fifth.section.desc4"/>
                    </ul>
                </div>
            </div>--%>
        </div>
    </div>
</div>
