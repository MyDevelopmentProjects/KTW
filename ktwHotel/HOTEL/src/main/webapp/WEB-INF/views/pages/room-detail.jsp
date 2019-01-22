<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="room-details container gen-padding">
    <div class="row">
        <div class="col-sm-6">
            <div id="flex-slider" class="flexslider">
                <ul class="slides">
                    <c:if test="${not empty data.getImageArray()}">
                        <c:forEach items="${data.getImageArray()}" var="item">
                            <li>
                                <img src="/uploads/${item}"
                                     alt="${data.translation.getTitleByKey(pageContext.response.locale)}">
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
            <div id="thumbnails" class="flexslider">
                <c:if test="${not empty data.getImageArray()}">
                    <ul class="slides">
                        <c:forEach items="${data.getImageArray()}" var="item">
                            <li>
                                <div style="background: url('/uploads/${item}');
                                        background-size: contain;
                                        background-position: center center;
                                        height: 100px;"></div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
            </div>
        </div>
        <div class="col-sm-6 info-frame">
            <h1>${data.translation.getTitleByKey(pageContext.response.locale)}</h1>
            <p>
                ${data.translation.getDescByKey(pageContext.response.locale)}
            </p>
            <ul class="detail-list list-unstyled">
                <li><strong>Bed:</strong> ${data.beds} bed</li>
                <li><strong>Max:</strong> ${data.maxPerson} people</li>
                <li><strong>Availability:</strong>
                    ${data.active == true ? 'Available' : 'Not available'}
                </li>
                <li><strong>Type:</strong>
                    ${data.typeTranslated}
                </li>
            </ul>

            <c:if test="${not empty data.videoUrl}">
                <iframe width="100%" height="315"
                        src="${data.videoUrl}"
                        frameborder="0" allow="autoplay; encrypted-media"
                        allowfullscreen></iframe>
            </c:if>

            <%--<div class="btn-holder">
                <a href="#" class="btn btn-default">Book Room</a>
                <strong class="rent-price">$235 <span>per night</span></strong>
            </div>--%>
        </div>
    </div>
</section>