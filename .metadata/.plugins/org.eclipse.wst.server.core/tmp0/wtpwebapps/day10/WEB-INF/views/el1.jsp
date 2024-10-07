<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>자바코드로 작성하기</h2>
	<% String data=(String) request.getAttribute("data"); %>
	<%= data %>
	
	<h2>EL 사용하기</h2>
	${data }
	
	<h2>저장소에 있는 것만 EL 사용 가능</h2>
	<% String str="El 쓰고싶어"; %>
	${str }
	
	<h2>EL사용시도: 저장소 이용</h2> 
	<ul>
	<li>pageContext</li>
	<li>request</li>
	<li>session</li>
	<li>application</li>
	</ul>
	
	<% pageContext.setAttribute("str", str); %>
	${str }
</body>
</html>