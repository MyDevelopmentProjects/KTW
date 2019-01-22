<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!-- about -->
<section class="about container b-padding" style="padding-bottom: 80px;">
    <div class="row">
        <header class="header col-xs-12 g-padding">
            <h1>
                <fmt:message key="home.inner.afewwords"/>
            </h1>
        </header>
    </div>
    <div class="row">
        <div class="col-sm-4 animate" data-anim-type="fadeInUp" data-anim-delay="300">
            <div class="box">
                <div class="icon ico-services" style="background: url('/images/star.png') !important; width: 64px !important;"></div>
                <h2><fmt:message key="home.inner.title1"/></h2>
                <p><fmt:message key="home.inner.desc1"/></p>
            </div>
        </div>
        <div class="col-sm-4 animate" data-anim-type="fadeInUp" data-anim-delay="600">
            <div class="box">
                <div class="icon ico-services" style="background: url('/images/ga.png') !important; width: 64px !important;"></div>
                <h2><fmt:message key="home.inner.title2"/></h2>
                <p><fmt:message key="home.inner.desc2"/></p>
            </div>
        </div>
        <div class="col-sm-4 animate" data-anim-type="fadeInUp" data-anim-delay="900">
            <div class="box">
                <div class="icon ico-reservation" style="background: url('/images/graphes.png') !important; width: 64px !important;" ></div>
                <h2><fmt:message key="home.inner.title3"/></h2>
                <p><fmt:message key="home.inner.desc3"/></p>
            </div>
        </div>
    </div>
</section>

<!-- restaurant -->
<section class="restaurant" style="background-image: url(/images/pattern.jpg);">
    <div class="container add-padding">
        <div class="row">
            <div class="col-sm-6 animate" data-anim-type="fadeInUp" data-anim-delay="300">
                <div class="text-box">
                    <h1>
                        <%--${restaurant.translation.getTitleByKey(pageContext.response.locale)}--%>
                        <fmt:message key="home.restaurant.title" />
                    </h1>
                    <p>
                        <%--${restaurant.translation.getDescByKey(pageContext.response.locale)}--%>
                        <fmt:message key="home.restaurant"/>
                    </p>

                    <%--<a href="#" class="btn btn-default">Book Now</a>--%>
                </div>
            </div>
            <div class="col-sm-6 animate" data-anim-type="fadeInUp" data-anim-delay="600">
                <div class="image-frame">
                    <c:if test="${not empty restaurant.getImageArray()}">
                        <div class="image-frame"
                             style="background: url('/uploads/${restaurant.getImageArray()[0]}');
                                     background-size: cover;
                                     background-position: center center;
                                     width: 100%;
                                     height: 400px;">
                        </div>
                    </c:if>
                    <c:if test="${empty restaurant.getImageArray()}">
                        <img src="/uploads/restaurant-main.jpg" alt="image description">
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>

<c:if test="${not empty rooms}">
    <section class="news container b-padding">
        <div class="row">
            <header class="header col-xs-12 g-padding">
                <h1><fmt:message key="home.inner.ourrooms"/></h1>
            </header>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <!-- carousel -->
                <div id="carousel-example-generic2" class="carousel slide news" data-ride="carousel">
                    <div class="carousel-inner">
                        <c:forEach items="${rooms}" var="item" varStatus="loop">
                            <div class="item ${loop.index == 0 ? 'active' : ''}">
                                <div class="col-sm-8 col">
                                    <div class="image-holder">
                                        <c:if test="${not empty item.getImageArray()}">
                                            <a href="/uploads/${item.getImageArray()[0]}" class="fancybox">
                                                <img src="/uploads/${item.getImageArray()[0]}" alt="image description">
                                            </a>
                                        </c:if>
                                        <c:if test="${empty item.getImageArray()}">
                                            <a href="images/img13.jpg" class="fancybox">
                                                <img src="/images/image-01.jpg" alt="image description">
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-sm-4 col">
                                    <div class="carousel-caption">
                                        <h2>${item.typeTranslated}
                                            - ${item.translation.getTitleByKey(pageContext.response.locale)}</h2>
                                        <p>
                                                ${item.translation.getDescByKey(pageContext.response.locale)}
                                        </p>
                                        <p>
                                            <strong class="rent-price">${item.price}$<span> per night</span></strong>
                                        </p>
                                        <a href="/rooms/${item.id}" class="btn btn-default">read more</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!-- Indicators -->
                    <div class="indicators col-sm-4">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic2" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic2" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic2" data-slide-to="2"></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </section>
</c:if>