<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div data-ix="load-fading-2-wine-page" class="_w-page main-section"
     style="background-image: url('/uploads/${wine.detailImage}');">
    <div data-ix="move-down-30" class="wine-primary-block">
        <a href="javascript:void(0)" class="category-link">
            ${wine.category.translation.getTitleByKey(pageContext.response.locale)}
        </a>
        <h3>
            ${wine.translation.getTitleByKey(pageContext.response.locale)}
        </h3>
        <p class="content-p wine-page">
            ${wine.translation.getDescByKey(pageContext.response.locale)}
        </p>
    </div>
    <jsp:include page="../includes/nav.jsp"/>
</div>
<div data-ix="float-menu-show" class="about-wine-content-section">
    <div class="about-wine-block w-container">
        <div class="about-wine-row w-row">
            <div class="about-wine-col w-col w-col-6">
                <div class="about-wine-wrapper">
                    <h4><fmt:message key="wine.about.wine"/></h4>
                    <p class="about-wine-p">
                        ${wine.getAbout(pageContext.response.locale)}
                    </p>
                </div>
            </div>
            <div class="about-wine-col w-col w-col-6">
                <div class="about-wine-wrapper">
                    <h4><fmt:message key="wine.profile"/></h4>
                    <div class="profile-row w-clearfix">
                        <div class="profile-col-option">
                            <p class="grey profile-row-p"><fmt:message key="wine.category"/></p>
                        </div>
                        <div class="profile-col-type">
                            <p class="profile-row-p">
                                ${wine.category.translation.getTitleByKey(pageContext.response.locale)}
                            </p>
                        </div>
                    </div>
                    <div class="profile-row w-clearfix">
                        <div class="profile-col-option">
                            <p class="grey profile-row-p"><fmt:message key="wine.region"/></p>
                        </div>
                        <div class="profile-col-type">
                            <p class="profile-row-p">
                                ${wine.getRegion(pageContext.response.locale)}
                            </p>
                        </div>
                    </div>
                    <div class="profile-row w-clearfix">
                        <div class="profile-col-option">
                            <p class="grey profile-row-p"><fmt:message key="wine.grape"/></p>
                        </div>
                        <div class="profile-col-type">
                            <p class="profile-row-p">
                                ${wine.getGrape(pageContext.response.locale)}
                            </p>
                        </div>
                    </div>
                    <div class="profile-row w-clearfix">
                        <div class="profile-col-option">
                            <p class="grey profile-row-p"><fmt:message key="wine.alco"/></p>
                        </div>
                        <div class="profile-col-type">
                            <p class="profile-row-p">
                                ${wine.getAlcohol(pageContext.response.locale)}
                            </p>
                        </div>
                    </div>
                    <div class="profile-row w-clearfix">
                        <div class="profile-col-option">
                            <p class="grey profile-row-p"><fmt:message key="wine.shugar"/></p>
                        </div>
                        <div class="profile-col-type">
                            <p class="profile-row-p">
                                ${wine.getSugar(pageContext.response.locale)}
                            </p>
                        </div>
                    </div>
                    <div class="profile-row w-clearfix">
                        <div class="profile-col-option">
                            <p class="grey profile-row-p"><fmt:message key="wine.Type"/></p>
                        </div>
                        <div class="profile-col-type">
                            <p class="profile-row-p">
                                ${wine.getGType(pageContext.response.locale)}
                            </p>
                        </div>
                    </div>
                    <div class="profile-row w-clearfix">
                        <div class="profile-col-option">
                            <p class="grey profile-row-p"><fmt:message key="wine.capacity"/></p>
                        </div>
                        <div class="profile-col-type">
                            <p class="profile-row-p">
                                ${wine.getCapacity(pageContext.response.locale)}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="slider-section-3">
        <div data-animation="slide" data-autoplay-limit="1" data-duration="800" id="slider" class="slider w-slider">
            <div class="slider-mask w-slider-mask">
                <c:forEach items="${wine.category.getImageArray()}" var="item">

                </c:forEach>
                <div class="slide-container w-slide" style="background-image: url('/uploads/5a29228c78034d0001d0eaf2_Webp.net-resizeimage-min.png');">
                    <div data-ix="in-slide-discription" class="slide-discription">
                        <div></div>
                    </div>
                </div>
            </div>
            <div data-ix="slider-arrow-hover-left" class="slider-arrow w-slider-arrow-left">
                <div class="slider-arrow-wrapper"><img src="/images/ic_slide-arrow_left_wt.svg"></div>
            </div>
            <div data-ix="slider-arrow-hover-right" class="slider-arrow w-slider-arrow-right">
                <div class="slider-arrow-right-wrapper"><img src="/images/ic_slide-arrow_right_wt.svg"></div>
            </div>
        </div>
    </div>
    <div data-ix="category-asortment-text-fade" class="category-discription">
        <div class="grape-bg"><img src="/images/grape.jpg"
                                   srcset="/images/grape-p-800.jpeg 800w, images/grape-p-1600.jpeg 1600w,
                                   /images/grape-p-2000.jpeg 2000w,
                                   /images/grape-p-2600.jpeg 2600w,
                                   /images/grape-p-3200.jpeg 3200w,
                                   /images/grape.jpg 3300w"
                                   sizes="100vw"></div>
        <h3 data-ix="move-down-30" class="category-heading">
            ${wine.category.translation.getTitleByKey(pageContext.response.locale)}
        </h3>
        <%--<p data-ix="move-down-30" class="category-wine-discription">For more than 45 years, our Sonoma Series wines have
            been known for their true varietal expression. Sourced from vineyards throughout the county, our Chief
            Winemaker takes a hands-on approach throughout the growing, harvesting, fermenting and aging processes to
            craft this range of fruit-driven wines that are proudly Sonoma County.</p>--%>
    </div>
    <div class="bottles-row-wrapper">
        <div class="bottles-row w-row">
            <c:if test="${not empty itemsbycategory}">
                <c:forEach items="${itemsbycategory}" var="item" varStatus="loop">
                    <div class="bottle-col w-col w-col-4">
                        <div class="wine-card">
                            <div class="wine-img-container">
                                <a href="/item/${item.id}" class="w-inline-block wine-img-square">
                                    <div class="wine-img-cont">
                                        <img src="/uploads/${item.image}">
                                    </div>
                                </a>
                            </div>
                            <div class="wine-name-container">
                                <h5>${item.translation.getTitleByKey(pageContext.response.locale)}</h5>
                                <a href="/item/${item.id}" class="small-arrow-link w-inline-block">
                                    <div>
                                        <fmt:message key="wine.view.details"/>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>