<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language"
       value="${not empty param.lang ? param.lang : not empty language ? language : 'en' }"
       scope="session"/>

<fmt:setLocale value="${pageContext.response.locale}" scope="session"/>

<c:set var="loadPageContent" value="${empty content ? 'main' : content}"/>

<%@include file="includes/header.jsp" %>

<jsp:include page="pages/${loadPageContent}.jsp" />

<%@include file="includes/footer.jsp" %>