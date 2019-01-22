<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${not empty category.getImageArray() && fn:length(category.getImageArray()) > 0}">
    <c:set var="topImage" scope="session" value="${category.getImageArray()[0]}"/>
</c:if>
<c:if test="${empty category.getImageArray() || fn:length(category.getImageArray()) == 0}">
    <c:set var="topImage" scope="session" value=""/>
</c:if>
<jsp:include page="../includes/nav.jsp">
    <jsp:param name="className" value="main-section product"/>
    <jsp:param name="headingText" value=""/>
    <jsp:param name="headingDesc" value=""/>
    <jsp:param name="bgImage" value="${topImage}"/>
</jsp:include>
<div data-ix="float-menu-show" class="bottles-content-section">
    <div data-ix="category-asortment-text-fade" class="category-discription">
        <h3 data-ix="move-down-30" class="category-heading">
            ${category.translation.getTitleByKey(pageContext.response.locale)}
        </h3>
        <%--<p data-ix="move-down-30" class="category-wine-discription">For more than 45 years, our Sonoma Series wines have
            been known for their true varietal expression. Sourced from vineyards throughout the county, our Chief
            Winemaker takes a hands-on approach throughout the growing, harvesting, fermenting and aging processes to
            craft this range of fruit-driven wines that are proudly Sonoma County.</p>--%>
    </div>
    <div class="bottles-row-wrapper">
        <c:if test="${not empty itemsbycategory}">
            <c:forEach items="${itemsbycategory}" var="item">
                <div class="bottle-col w-col w-col-4">
                    <div class="wine-card">
                        <div class="wine-img-container">
                            <a href="/item/${item.id}" class="w-inline-block wine-img-square">
                                <div class="wine-img-cont"><img src="/uploads/${item.image}" class="wine-image"></div>
                            </a>
                        </div>
                        <div class="wine-name-container">
                            <h5>
                                    ${item.translation.getTitleByKey(pageContext.response.locale)}
                            </h5>
                            <a href="/item/${item.id}" class="small-arrow-link w-inline-block">
                                <div><fmt:message key="categpies.explore.wines"/></div>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>