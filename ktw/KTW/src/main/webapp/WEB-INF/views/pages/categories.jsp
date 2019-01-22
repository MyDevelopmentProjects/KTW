<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../includes/nav.jsp">
    <jsp:param name="className" value="assortment main-section categories"/>
    <jsp:param name="headingText" value="${headingTitle}"/>
    <jsp:param name="headingDesc" value="${headingDesc}"/>
    <jsp:param name="bgImage" value=""/>
</jsp:include>
<div data-ix="float-menu-show" class="assortment-content-section">
    <div data-ix="category-wine-show" class="categoty-block">
        <c:if test="${not empty categories}">
            <c:forEach items="${categories}" var="item">
                <div class="categroy-container w-clearfix">
                    <a href="items/category/${item.id}">
                        <div class="img-col"
                             style="background: url('/uploads/${item.image}'); background-size: cover; background-position: center center; background-repeat: no-repeat;">

                            <div class="category-img-wrapper" style="height: 500px; max-width: 100%; float: right;">
                            </div>

                        </div>
                    </a>
                    <div class="category-discription-col">
                        <h3>${item.translation.getTitleByKey(pageContext.response.locale)}</h3>
                        <p class="category-paragraph">
                                <%--${item.translation.getDescByKey(pageContext.response.locale)}--%>
                        </p>
                        <a href="items/category/${item.id}" class="arrow-link w-inline-block">
                            <div><fmt:message key="categpies.explore.wines"/></div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <%--no-border w-clearfix--%>
    </div>
</div>