<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<div class="container gen-padding">
    <div class="row">
        <!-- side bar -->
       <%-- <aside class="col-md-3 col-sm-4 sidebar">
            <section class="widget">
                <h1>filter by</h1>
                <div class="holder">
                    <div class="block">
                        <h2>room type</h2>
                        <form action="#">
                            <ul class="list-unstyled">
                                <li>
                                    <label for="check-1">
                                        <input id="check-1" type="checkbox">
                                        <span class="fake-input"></span>
                                        <span class="fake-label">
                                            <fmt:message key="room.types.all" />
                                        </span>
                                    </label>
                                </li>
                                <li>
                                    <label for="check-2">
                                        <input id="check-2" type="checkbox">
                                        <span class="fake-input"></span>
                                        <span class="fake-label">
                                            <fmt:message key="room.types.single" />
                                        </span>
                                    </label>
                                </li>
                                <li>
                                    <label for="check-3">
                                        <input id="check-3" type="checkbox">
                                        <span class="fake-input"></span>
                                        <span class="fake-label">
                                            <fmt:message key="room.types.double" />
                                        </span>
                                    </label>
                                </li>
                                <li>
                                    <label for="check-4">
                                        <input id="check-4" type="checkbox">
                                        <span class="fake-input"></span>
                                        <span class="fake-label">
                                            <fmt:message key="room.types.presidential" />
                                        </span>
                                    </label>
                                </li>
                                <li>
                                    <label for="check-5">
                                        <input id="check-5" type="checkbox">
                                        <span class="fake-input"></span>
                                        <span class="fake-label">
                                            <fmt:message key="room.types.family" />
                                        </span>
                                    </label>
                                </li>
                            </ul>
                        </form>
                    </div>
                    <div class="block">
                        <h2>Price</h2>
                        <div class="range-slider">
                            <div id="slider"></div>
                        </div>
                    </div>
                </div>
            </section>
        </aside>--%>
        <!-- content -->
        <div class="col-md-12 col-sm-12 content">
            <div class="row rooms">
                <c:if test="${not empty data}">
                    <c:forEach items="${data.results}" var="item">
                        <article class="col-md-4 col-xs-6">
                            <div class="box">
                                <a href="/rooms/${item.id}">
                                    <c:if test="${not empty item.getImageArray()}">
                                        <div class="image-frame"
                                             style="background: url('/uploads/${item.getImageArray()[0]}');
                                                     background-size: cover;
                                                     background-position: center center;
                                                     width: 100%;
                                                     height: 250px;">
                                        </div>
                                    </c:if>
                                    <c:if test="${empty item.getImageArray()}">
                                        <div class="image-frame">
                                            <img src="/images/thumb-04.jpg" alt="image description">
                                        </div>
                                    </c:if>
                                    <div class="info-block">
                                        <div class="info-frame">
                                            <h1>
                                                ${item.translation.getTitleByKey(pageContext.response.locale)}
                                            </h1>
                                            <div class="text-box">
                                                <p>${item.typeTranslated}</p>
                                                <strong class="rent-price">${item.price}$<span>per night</span></strong>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </article>
                    </c:forEach>
                </c:if>
            </div>
            <%--<div class="row">
                <div class="col-md-6 col-sm-12">
                    <strong class="showing-results">Showing results: 3 to 11, total 42</strong>
                </div>
                <div class="col-md-6 col-sm-12">
                    <nav class="paging">
                        <strong class="heading">Page:</strong>
                        <ul class="pagination">
                            <li class="hidden">
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true" class="glyphicon glyphicon-triangle-right"></span>
                                </a>
                            </li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true" class="glyphicon glyphicon-triangle-right"></span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>--%>
        </div>
    </div>
</div>