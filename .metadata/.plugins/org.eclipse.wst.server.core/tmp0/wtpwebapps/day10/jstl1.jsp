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

	<h2>1~10까지 반복 자바코드</h2>
	<%
	for(int i=1; i<=10; i++){
		out.print(i);
	}
	%>
	
	<h2>1~10까지 반복 jstl</h2>
	<c:forEach var="su" begin="1" end="10"> 
	${su }
	</c:forEach>

</body>
</html>