<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/login.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${requestScope.isSuccess }">
			<c:if test="${empty param.url }">
					<script>
					alert("로그인 완료");
					location.href="${pageContext.request.contextPath}/home.do";
					</script>
			</c:if>
			<c:if test="${not empty param.url }">
				<script>
				alert("로그인 완료");
				location.href="${param.url }";
				</script>
			</c:if>
	</c:when>
			<c:otherwise>
				<script>
					alert("로그인 실패.");
					location.href="${pageContext.request.contextPath}/home.do";
				</script>
			</c:otherwise>
</c:choose>
</body>
</html>











