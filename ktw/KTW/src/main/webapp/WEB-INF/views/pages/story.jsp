<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../includes/nav.jsp">
    <jsp:param name="className" value="assortment main-section story"/>
    <jsp:param name="headingText" value="${headingTitle}"/>
    <jsp:param name="headingDesc" value="${headingDesc}"/>
</jsp:include>
<div data-ix="float-menu-show" class="content-section">
    <div class="cradle-of-wine-block w-container">
        <div class="bg-img-cofw-wrapper"><img src="images/gr_map.svg" width="1060"></div>
        <div class="cofw-container">
            <h3><fmt:message key="story.gradle.of.wine.title"/></h3>
            <div class="content-wrapper w-clearfix">
                <p class="content-p red-line">
                    <fmt:message key="story.gradle.of.wine.desc1"/>
                </p>
                <div class="block-quote">
                    <div class="bq-wrapper">
                        <div class="bottom separetor"></div>
                        <div class="separetor"></div>
                        <p class="bq-text">
                            <fmt:message key="story.gradle.of.wine.desc2"/>
                        </p>
                    </div>
                </div>
                <p class="content-p">
                    <fmt:message key="story.gradle.of.wine.desc3"/>
                </p>
                <p class="content-p">
                    <fmt:message key="story.gradle.of.wine.desc4"/>
                </p>
            </div>
        </div>
    </div>
    <div class="slider-section">
        <div data-animation="slide" data-autoplay-limit="1" data-duration="800" id="slider" class="slider w-slider">
            <div class="slider-mask w-slider-mask">
                <div class="slide-container w-slide" style="background: url('uploads/story5.jpg')">
                    <div data-ix="in-slide-discription" class="slide-discription">
                        <div></div>
                    </div>
                </div>
            </div>
            <%--<div data-w-id="a99c5b3b-96d5-07c5-7b15-e73ff1f0e5bf" class="slider-arrow w-slider-arrow-left">
                <div class="slider-arrow-wrapper"><img src="images/ic_slide-arrow_left_wt.svg"></div>
            </div>
            <div data-w-id="37f7197c-6b37-942d-68c1-ff244c7651cd" class="slider-arrow w-slider-arrow-right">
                <div class="right slider-arrow-wrapper"><img src="images/ic_slide-arrow_right_wt.svg"></div>
            </div>--%>
        </div>
    </div>
    <div class="qvev-tec-block w-container">
        <div class="bg-img-qvev-wrap">
            <img src="images/qvev.png" width="1060"
              srcset="images/qvev-p-500.png 500w,
              images/qvev-p-800.png 800w,
              images/qvev-p-1080.png 1080w,
              images/qvev-p-1600.png 1600w,
              images/qvev-p-2000.png 2000w,
              images/qvev-p-2600.png 2600w,
              images/qvev.png 2714w"
              sizes="(max-width: 991px) 100vw, 1060px"></div>
        <div class="cofw-container">
            <h3><fmt:message key="story.qvevri.technoloty.title"/></h3>
            <div class="content-wrapper">
                <p class="content-p red-line">
                    <fmt:message key="story.qvevri.technology.desc1"/>
                </p>
                <p class="content-p">
                    <fmt:message key="story.qvevri.technology.desc2"/>
                </p>
                <div class="paragraph-img-container">
                    <div class="paragraph-img-wrap w-clearfix">
                        <div class="image-quote">
                            <div class="bq-wrapper smaler-txt">
                                <div class="bottom separetor"></div>
                                <div class="separetor"></div>
                                <p class="bq-text"><fmt:message key="story.qvevri.technology.desc3"/></p>
                            </div>
                        </div>
                        <img src="images/ph_q_2.png"
                             srcset="images/ph_q_2-p-500.png 500w,
                                     images/ph_q_2-p-800.png 800w,
                                     images/ph_q_2-p-1080.png 1080w,
                                     images/ph_q_2-p-1600.png 1600w,
                                     images/ph_q_2.png 1860w"
                             sizes="(max-width: 767px) 100vw, (max-width: 991px) 630.96875px, 940px"></div>
                    <div class="img-discription">
                        <div></div>
                    </div>
                </div>
                <p class="content-p"><fmt:message key="story.qvevri.technology.desc4"/></p>
                <p class="content-p"><fmt:message key="story.qvevri.technology.desc5"/></p>
            </div>
        </div>
    </div>
</div>
<div class="board-of-elders-section" style="background-image: url('/uploads/5a2937a15a27480001df31ae_11428107_10153050386032981_6819690879741444490_o-min.jpg')">
    <div class="bofe-container">
        <h3 class="bofe-heading" style="color:rgb(158, 48, 91) !important;"><fmt:message key="story.board.of.elders.title"/></h3>
        <div class="bofe-p-container" style="background: #00000085;padding: 20px;">
            <p class="red-line white-p">
                <fmt:message key="story.board.of.elders.desc1"/>
            </p>
            <p class="white-p">
                <fmt:message key="story.board.of.elders.desc2"/>
            </p>
        </div>
    </div>
</div>