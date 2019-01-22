<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="about-us container add-padding" style="background-image: url(/images/pattern.jpg);">
    <div class="row">
        <div class="col-sm-6 animate" data-anim-type="fadeInUp" data-anim-delay="300">
            <div class="text-box">
                <h1>${data.translation.getTitleByKey(pageContext.response.locale)}</h1>
                ${data.translation.getDescByKey(pageContext.response.locale)}
            </div>
        </div>
        <div class="col-sm-6 animate" data-anim-type="fadeInUp" data-anim-delay="600">
            <div class="image-frame">
                <c:if test="${not empty data.getImageArray()}">
                    <div class="image-frame"
                         style="background: url('/uploads/${data.getImageArray()[0]}');
                                 background-size: cover;
                                 background-position: center center;
                                 width: 100%;
                                 height: 400px;">
                    </div>
                </c:if>
                <c:if test="${empty data.getImageArray()}">
                    <div class="image-frame">
                        <img src="/images/image-02.jpg" alt="image description">
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>

<!-- gallery-section -->

<c:if test="${not empty data.getImageArray()}">
    <section class="gallery-section">
        <div class="container-fluid">
            <div class="row">
                <c:forEach items="${data.getImageArray()}" var="item">
                    <article class="col-md-3 col-xs-6">
                        <div class="image-frame"
                             style="background: url('/uploads/${item}');
                                     background-size: cover;
                                     background-position: center center;
                                     width: 100%;
                                     height: 250px;">
                        </div>
                    </article>
                </c:forEach>
            </div>
        </div>
    </section>
</c:if>
<%--
<!-- menu section -->
<section class="menu-section container add-padding">
    <div class="row">
        <header class="col-xs-12">
            <h1>Taste our delicious dishes</h1>
        </header>
    </div>
    <div class="row">
        <!-- carousel -->
        <div id="carousel-example-generic" class="carousel menu-carousel slide" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div class="col-sm-6">
                        <ul class="list-unstyled menu-list">
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-01.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$12</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-02.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$45</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-03.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$23</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        <ul class="list-unstyled menu-list">
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-04.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$15</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-05.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$87</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-06.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$24</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="item">
                    <div class="col-sm-6">
                        <ul class="list-unstyled menu-list">
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-01.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$12</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-02.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$45</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-03.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$23</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        <ul class="list-unstyled menu-list">
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-04.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$15</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-05.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$87</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-06.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$24</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="item">
                    <div class="col-sm-6">
                        <ul class="list-unstyled menu-list">
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-01.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$12</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-02.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$45</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-03.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$23</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        <ul class="list-unstyled menu-list">
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-04.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$15</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-05.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$87</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="image-frame"><img src="/images/img-06.jpg" alt="image description">
                                    </div>
                                    <div class="text">
                                        <h2>Wellfleet oysters</h2>
                                        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
                                            eu fugiat nulla pariatur.</p>
                                    </div>
                                    <div class="price">$24</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- carousel-indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
        </div>
    </div>
</section>--%>
