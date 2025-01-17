<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jsp에서 사용할 수 있는 저장소</h2>
	<ul>
		<li>pageContext</li>
		<li>request</li>
		<li>session</li>
		<li>application</li>
	</ul>

	<h2>EL문법: 저장소에 있는 값들을 쉽게 사용할 수 있게 해줌</h2>
	<% pageContext.setAttribute("data", "hello"); %>
	${date}
	<% request.setAttribute("data2", "hello2"); %>
	<% String result=(String) request.getAttribute("date2"); %>
	<%= result %>  
	${data2}
	
	<h2>pageContext -> request -> session -> application </h2>
	<% pageContext.setAttribute("userID", "hong pageContext"); %>
	<% request.setAttribute("userID", "hong request"); %>
	<% session.setAttribute("userID", "hong session"); %>
	<% application.setAttribute("userID", "hong application"); %>
	
	<h2>userId 값 확인하기</h2>
	${userID }
	
	<h2>각가의 저장소에서 값 꺼내오기</h2>
	${sessionScope.userId }
	${requestScope.userId }
	${applicationScope.userId }
	${pageContextScope.userId }
	
</body>
</html>