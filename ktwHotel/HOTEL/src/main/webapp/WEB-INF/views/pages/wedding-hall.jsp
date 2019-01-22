<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="rooms-section container add-padding">
    <div class="row">
        <c:if test="${not empty data}">
            <c:forEach items="${data.results}" var="item">
                <article class="col-sm-4 info-block animate" data-anim-type="fadeInUp" data-anim-delay="100" style="margin-bottom: 28px;">
                    <div class="image-frame">
                        <c:if test="${not empty item.image}">
                            <div class="info-frame">
                                <a href="/uploads/${item.image}" class="fancybox magnify"></a>
                            </div>
                            <img src="/uploads/${item.image}" alt="image description">
                        </c:if>
                        <c:if test="${not empty item.videoUrl}">
                            <iframe width="100%" height="315"
                                    src="${item.videoUrl}"
                                    frameborder="0"
                                    allow="autoplay; encrypted-media"
                                    allowfullscreen></iframe>
                        </c:if>
                    </div>
                </article>

            </c:forEach>
        </c:if>
    </div>
</section>