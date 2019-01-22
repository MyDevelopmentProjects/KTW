<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<jsp:include page="../includes/nav.jsp">
    <jsp:param name="className" value="assortment main-section shop-section"/>
    <jsp:param name="headingText" value="${headingTitle}"/>
    <jsp:param name="headingDesc" value="${headingDesc}"/>
</jsp:include>
<div data-ix="float-menu-show" class="content-section">
    <c:if test="${not empty shops && fn:length(shops) > 0}">
        <div class="shop-block w-container">
            <div class="shop-check-block">
                <div class="drop-heading">select the city store</div>
                <div data-delay="300" class="shop-drop w-dropdown">
                    <div data-ix="drop-hover-arrow" class="shop-drop-toggle w-dropdown-toggle">
                        <div class="city-name">
                                ${shops[0].translation.getTitleByKey(pageContext.response.locale)}
                        </div>
                        <div class="adress">
                                ${shops[0].getAddress()}
                        </div>
                        <div class="drop-arrow">
                            <img src="images/ic-drop_arrow.svg">
                        </div>
                    </div>
                    <nav data-ix="dropdown" class="shop-check-list w-dropdown-list">
                        <c:forEach items="${shops}" var="item">
                            <a href="#" img="${item.image}" class="drop-list-link w-inline-block" data-id="${item.id}"
                               data-lat="${item.lat}" data-lng="${item.lng}" s>
                                <div class="city-name">
                                        ${item.translation.getTitleByKey(pageContext.response.locale)}
                                </div>
                                <div class="adress">
                                        ${item.getAddress()}
                                </div>
                            </a>
                        </c:forEach>
                    </nav>
                </div>
            </div>
        </div>
        <div class="slider-shop-section">
            <div data-animation="slide" data-autoplay-limit="1" data-duration="800" id="slider" class="slider w-slider">
                <div class="slider-shop-mask w-slider-mask">
                    <div class="shops slide-container w-slide"></div>
                </div>
            </div>
            <div class="map-shop-wrapper">
                <div class="map w-widget w-widget-map" id="gmap"></div>
            </div>
        </div>
        <div class="shop-info-container w-container">
            <div class="img-list-container">
                <div class="discript-slider-col">
                    <c:forEach items="${shops}" var="item">
                        <div class="veranda-content-container" data-id="${item.id}" data-lat="${item.lat}"
                             data-lng="${item.lng}">
                            <h3 class="h2-veranda">${item.translation.getTitleByKey(pageContext.response.locale)}</h3>
                            <div class="contact-text-block">
                                <div class="contact-shop-text-heading">
                                    <div><fmt:message key="home.contacts.address"/></div>
                                </div>
                                <div class="shop-contact-text">
                                    <div>${item.address}</div>
                                </div>
                            </div>
                            <div class="contact-text-block">
                                <div class="contact-shop-text-heading">
                                    <div><fmt:message key="home.contacts.phone"/></div>
                                </div>
                                <div class="shop-contact-text">
                                    <div>${item.phone}</div>
                                </div>
                            </div>
                            <div class="contact-text-block">
                                <div class="contact-shop-text-heading">
                                    <div>Fax</div>
                                </div>
                                <div class="shop-contact-text">
                                    <div>${item.fax}</div>
                                </div>
                            </div>
                            <div class="contact-text-block">
                                <div class="contact-shop-text-heading">
                                    <div><fmt:message key="home.contacts.email"/></div>
                                </div>
                                <div class="shop-contact-text">
                                    <a class="link-black">
                                            ${item.email}
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:if>
</div>
<script>

    document.addEventListener('DOMContentLoaded', function () {

        $('.drop-list-link').on('click', function (e) {
            var img = $(e.currentTarget).attr('img')
            if (img) {
                $('.slide-container.w-slide').css('background-image', 'url(/uploads/' + img + ')')
            }
        });

        var items = document.getElementsByClassName('veranda-content-container');
        var dropdownlist = document.getElementsByClassName("drop-list-link");

        for (var i = 0; i < items.length; i++) {
            if (i > 0) {
                items[i].style.display = "none";
            }
        }

        for (var u = 0; u < dropdownlist.length; u++) {
            dropdownlist[u].addEventListener("click", function (elm) {
                var id = elm.currentTarget.getAttribute("data-id");

                for (var i = 0; i < items.length; i++) {
                    if (items[i].getAttribute("data-id") === id) {
                        items[i].style.display = "block";
                    } else {
                        items[i].style.display = "none";
                    }
                }

                var lat = elm.currentTarget.getAttribute("data-lat");
                var lng = elm.currentTarget.getAttribute("data-lng");
                var map = new google.maps.Map(document.getElementById('gmap'), {
                    zoom: 13,
                    center: new google.maps.LatLng(lat, lng)
                });
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(lat, lng),
                    map: map,
                    draggable: true
                });
                var latlng = new google.maps.LatLng(lat, lng);
                marker.setPosition(latlng);

            });
        }


    }, false);

</script>