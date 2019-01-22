<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<div class="container gen-padding">
    <div class="row">
        <div class="col-md-12 col-sm-12 content">
            <div class="row rooms">
                <c:if test="${not empty data}">
                    <c:forEach items="${data.results}" var="item">
                        <article class="col-md-4 col-xs-6">
                            <div class="box">
                                <a href="/tours/${item.id}">
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
                                                <strong class="rent-price">${item.price}$</strong>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </article>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </div>
</div>