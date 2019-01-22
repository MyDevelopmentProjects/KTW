<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty param.bgImage}">
    <c:set var="bmImage" value="background-image: url('/uploads/${param.bgImage}');"/>
</c:if>

<div data-ix="load-fading" class="${param.className}" style="${bmImage}">

    <%@include file="navInitial.jsp" %>
    <% if (request != null && request.getParameter("headingText") != null) { %>
    <div data-ix="move-down-30" class="category-primary-block">
        <h1 class="primary-heading">
            <%=request.getParameter("headingText")%>
        </h1>
        <%--
        <% if (request.getParameter("headingDesc") != null) { %>
        <p class="primary-discription">
            <%=request.getParameter("headingDesc")%>
        </p>
        <% } %>--%>
    </div>
    <% } %>

</div>