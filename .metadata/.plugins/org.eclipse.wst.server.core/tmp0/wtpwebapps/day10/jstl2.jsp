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
	int su=70;
	if(su>=90){
		out.print("수");
	} else if(su>=80){
		out.print("우");
	}  else if(su>=70){
		out.print("미");
	}  else{
		out.print("가");
	}
	%>
	
	<h2>조건문: JSTL</h2>
	<c:set var="kor" value="80"> 
	</c:set>
	
	<!-- $ : storage -->
	<c:choose>
	<c:when test="${kor>=90 }">수</c:when>
	<c:when test="${kor>=80 }">우</c:when>
	<c:when test="${kor>=70 }">미</c:when>
	<c:otherwise>가</c:otherwise>
	</c:choose>
</body>
</html>