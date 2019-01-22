<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav data-ix="dropdown" class="drop-bg menu w-dropdown-list">
    <c:if test="${not empty categories}">
        <c:forEach items="${categories}" var="item">
            <a href="/items/category/${item.id}" class="drop-menu-link w-dropdown-link">
                    ${item.translation.getTitleByKey(pageContext.response.locale)}
            </a>
        </c:forEach>
    </c:if>
</nav>