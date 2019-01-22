<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<jsp:include page="../includes/nav.jsp">
    <jsp:param name="className" value="assortment main-section factory-top"/>
    <jsp:param name="headingText" value="${headingTitle}"/>
    <jsp:param name="headingDesc" value="${headingDesc}"/>
</jsp:include>
<div data-ix="float-menu-show" class="content-section g-marani">
    <div class="af-block w-container">
        <div class="cofw-container">
            <h3><fmt:message key="factories.first.section.title"/></h3>
            <div class="content-wrapper w-clearfix">
                <p class="content-p red-line">
                    <fmt:message key="factories.first.section.desc1"/>
                </p>
                <div class="block-quote">
                    <div class="bq-wrapper">
                        <div class="bottom separetor"></div>
                        <div class="separetor"></div>
                        <p class="bq-text">
                            <fmt:message key="factories.first.section.desc4"/>
                        </p>
                    </div>
                </div>
                <p class="content-p"><fmt:message key="factories.first.section.desc2"/></p>
                <p class="content-p"><fmt:message key="factories.first.section.desc3"/></p>
            </div>
        </div>
    </div>
    <div class="factory-slider-section">
        <div data-animation="slide" data-autoplay-limit="1" data-duration="800" id="slider" class="slider w-slider">
            <div class="slider-mask w-slider-mask">
                <div class="slide-container w-slide"
                     style="background-image: url('uploads/5a0d679ceb1c190001facfb1_Screenshot-(27)-min.jpg')">
                    <div data-ix="in-slide-discription" class="slide-discription">
                        <div></div>
                    </div>
                </div>
            </div>
            <%--<div data-ix="slider-arrow-hover-left" class="slider-arrow w-slider-arrow-left">--%>
                <%--<div data-w-id="fa69b07e-0ecf-8b68-5923-3e6d8a5aab7e" class="slider-arrow-wrapper"><img--%>
                        <%--src="images/ic_slide-arrow_left_wt.svg"></div>--%>
            <%--</div>--%>
            <%--<div data-ix="slider-arrow-hover-right" data-w-id="0206ed1d-c936-49a5-ecbd-768027a011dd"--%>
                 <%--class="slider-arrow w-slider-arrow-right">--%>
                <%--<div data-w-id="639f202e-96e1-affd-4917-451be2a930b9" class="slider-arrow-right-wrapper"><img--%>
                        <%--src="images/ic_slide-arrow_right_wt.svg"></div>--%>
            <%--</div>--%>
        </div>
    </div>
    <div class="af-2-block w-container">
        <div class="cofw-container">
            <h3><fmt:message key="factories.second.section.title"/></h3>
            <div class="content-wrapper">
                <p class="content-p red-line">
                    <fmt:message key="factories.second.section.desc1"/>
                </p>
                <div class="paragraph-img-container">
                    <div class="paragraph-slider-wrap w-clearfix">
                        <div class="factory image-quote">
                            <div class="bq-wrapper smaler-txt">
                                <div class="bottom separetor"></div>
                                <div class="separetor"></div>
                                <p class="bq-text"><fmt:message key="factories.second.section.desc4"/></p>
                            </div>
                        </div>
                        <div data-animation="slide" data-duration="500" data-infinite="1"
                             class="slider-paragraph-container w-slider">
                            <div class="slider-paragraph-mask w-slider-mask">
                                <div class="paragraph-slide w-slide"
                                     style="background-image: url('/uploads/5a0d677e8174eb0001b34ee4_Screenshot-(16)-min.jpg')"></div>
                            </div>
                        </div>
                    </div>
                    <div class="img-discription">
                        <div></div>
                    </div>
                </div>
                <p class="content-p"><fmt:message key="factories.second.section.desc2"/></p>
                <p class="content-p"><fmt:message key="factories.second.section.desc3"/></p>
            </div>
        </div>
    </div>
</div>
