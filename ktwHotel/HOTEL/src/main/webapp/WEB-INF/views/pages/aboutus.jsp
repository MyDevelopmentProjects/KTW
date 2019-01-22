<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="about-us container add-padding">
    <div class="row">
        <div class="col-sm-6 animate" data-anim-type="fadeInUp" data-anim-delay="300">
            <div class="text-box">
                <h1>${data.translation.getTitleByKey(pageContext.response.locale)}</h1>
                ${data.translation.getDescByKey(pageContext.response.locale)}
            </div>
        </div>
        <div class="col-sm-6 animate" data-anim-type="fadeInUp" data-anim-delay="600">
            <div class="image-frame">
                <c:if test="${not empty data.image}">
                    <div class="image-frame"
                         style="background: url('/uploads/${data.image}');
                                 background-size: cover;
                                 background-position: center center;
                                 width: 100%;
                                 height: 400px;">
                    </div>
                </c:if>
                <c:if test="${empty data.image}">
                    <img src="http://cdandr.net//wp-content/uploads/2017/10/champion-design-and-rebuild-about-us-01.jpg" alt="image description">
                </c:if>
            </div>
        </div>
    </div>
</section>