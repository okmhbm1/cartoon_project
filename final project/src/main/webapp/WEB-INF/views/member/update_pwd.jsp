<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/update_pwd.jsp</title>
</head>
<body>
<script>
		alert("비밀번호수정완료");
		location.href="${pageContext.request.contextPath}/member/info.do";
</script>
</body>
</html>