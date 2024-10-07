<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% 
	int su=80;
	if(su>=90){
		out.print("수");
	} else{
		out.print("수 없음");
	}
	%>

	<% int num=90; %>
	<% pageContext.setAttribute("num", num); %>
	
	<h2>조건문: JSTL</h2>
	<c:if test="${num>=90 }">
	수
	</c:if>
	
	<h2>조건문: JSTL2</h2>
	<c:set var="score" value="90"> 
	<!-- jstl 변수 만들기: 자동으로 pageContext 저장소에 저장 -->
	</c:set>
	
	<c:if test="${score>=90 }">
	수
	</c:if>
</body>
</html>