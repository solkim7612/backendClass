<%@ page import="java.util.List" %>
<%@ page import="blindWeb.Comments" %>
<%@ page import="blindWeb.Post" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post</title>
<link rel="stylesheet" href="/blindWeb/css/index.css">
<link rel="stylesheet" href="/blindWeb/css/post.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
function regReview() {
    // 댓글 입력 필드에서 값 가져오기
    let review = $("#review").val();
    
    // 현재 날짜 생성
    let currentDate = new Date().toLocaleString(); // 포맷을 원하는 형식으로 조정할 수 있습니다.

    // Ajax를 통해 댓글 등록하는 코드
    let dataValue = {userId: "********", postUserCompany: "**회사", postDate: currentDate, postContents: review};
    
    $.ajax({
        type: "post",
        url: "/blindWeb/post",
        data: dataValue,
        success: function (data) {
            console.log(data); // 서버에서 응답받은 데이터 확인

            // 새로운 댓글을 ul에 <li>로 추가
            let newComment = `
                <li>
                    <div>
                        <strong>\${data.postUserCompany}</strong>  \${data.userId}<br>
                        \${data.postContents}<br> 
                        <em>\${data.postDate}</em>
                    </div>
                    <div class="buttonContainer">
                    <button class="editCommentBTN">수정하기</button>
                    <button class="deleteCommentBTN">삭제하기</button>
                	</div>
                </li>
            `;
            
            // commentsList 아래에 새로운 댓글 추가
            $("#commentsList").append(newComment);

            // 댓글 입력란 초기화
            $("#review").val("");

            alert("댓글이 등록되었습니다.");
        },
        error: function (error) {
            console.log(error);
            alert("댓글 등록에 실패했습니다.");
        }
    });
}

$(document).ready(function() {
    // 수정 버튼 이벤트
    $(document).on('click', '.editCommentBTN', function() {
        const commentDiv = $(this).closest('li').find('div:first');
        const currentContent = commentDiv.find('br').get(0).nextSibling.nodeValue.trim(); 
        const updatedContent = prompt("댓글을 수정하세요:", currentContent);

        if (updatedContent !== null && updatedContent.trim() !== "") {
            commentDiv.find('br').get(0).nextSibling.nodeValue = ` ${updatedContent}`; // 업데이트된 댓글 내용 반영
            alert("댓글이 수정되었습니다.");
        }
    });

    // 삭제 버튼 이벤트
    $(document).on('click', '.deleteCommentBTN', function() {
        if (confirm("이 댓글을 삭제하시겠습니까?")) {
            $(this).closest('li').remove(); // 댓글 삭제
            alert("댓글이 삭제되었습니다.");
        }
    });
});
</script>
</head>
<body>

<header>

    <div class="header_top">
        <b>블라인드</b> 기업서비스 <b> > </b>
    </div>
    
    <div class="header_bottom">
    	<span class="header_bottom_logo"> 
    		<a href="<%= request.getContextPath() %>/index" style="text-decoration: none;">blind</a> 
    		<sup>TOPIC</sup> 
    	</span>
    	<ul class="header_bottom_menu">
    		<li>
    			<a href="<%= request.getContextPath() %>/index" style="text-decoration: none;" class="home">홈</a>
    		</li>
		    <li>기업 리뷰</li>
		    <li>채용공고<sup class="menu_sup">blind Hire</sup></li>
    	</ul>
	    <div class="header_bottom_button">
	    	<button type="button" class="wrt_btn">글쓰기</button>
	        <button type="button" class="log_btn">로그인</button>
	    </div>
    </div>
    
</header>

<%
   Post post = (Post)request.getAttribute("post");
   List<Comments> commentsList = (List<Comments>) request.getAttribute("comments");
%>

<main>
    <img class="main_banner" alt="광고사진" src="/blindWeb/img/15940192125655449145.jpg" >
    
    <section class="main_post">
    	<div class="main_post_header">
    		<h5>토픽베스트 > </h5>
    		<h1><%= post.getPostTitle() %></h1>
    		<div class="UserInfo">
    			<p><%= post.getPostUserCompany() %></p>
    			<p><%= post.getUserId() %></p>
    		</div>
    		<p><%= post.getPostDate() %></p> <!-- Date 형식 확인 필요 -->
    	</div>
    	
    	<div class="main_post_main">
	    	<div class="main_post_main_content">
	    		 <%= post.getPostContents() %>
	    	</div>
	    	<div class="main_post_main_URL">
		    	<img alt="" src="/blindWeb/img/free-icon-kakao-talk-3669973.png">
		    	<img alt="" src="/blindWeb/img/free-icon-facebook-145802.png">
		    	<img alt="" src="/blindWeb/img/free-icon-twitter-3670151.png">
		    	<img alt="" src="/blindWeb/img/images.png">
		    	<img alt="" src="/blindWeb/img/images (1).png">
	    	</div>
    	</div>
    	
    	<div class="main_post_footer">
    		<div class="main_post_footer_OnlyApp">
    			<input type="text" placeholder="댓글을 남겨주세요." id="review">
    			<button class="wrt_btn" onclick="regReview()">등록하기</button>
    		</div>
    		<div class="main_post_footer_replyContent">
		    <h3>댓글 목록</h3>
		    <ul id="commentsList"> 
			    <% 
			        if (commentsList != null && !commentsList.isEmpty()) {
			    %>
			        <% for (Comments comment : commentsList) { %>
			        <li>
			            <div>
			                <strong><%= comment.getCommentsUserCompany() %></strong> <%= comment.getUserId() %> <br>
			                <%= comment.getCommentsContents() %><br>
			                <em><%= comment.getFormattedCommentsDate() %></em>
			            </div>
			        </li>
			        <% } %>
			    <% 
			        } else { 
			    %>
			        <p>현재 등록된 댓글이 없습니다. 첫 번째 댓글을 작성해보세요!</p>
			    <% 
			        } 
			    %>
			</ul>
			</div>
    	</div>
    </section>
</main>

<footer>
    <div class="footer_top">
    
        <ul class="footer_top_menu">
            <li>서비스 소개</li>
            <li>이용약관</li>
            <li>디렉토리</li>
            <li>개인정보 처리방침</li>
            <li>인재채용</li>
            <li>블라인드 기업서비스</li>
            <li>신고가이드</li>
        </ul>
        
        <div class="footer_top_botton">
            <button type="button"><img alt="apple" src="/blindWeb/img/free-icon-apple-logo-747.png" width=24px> APP STORE</button>
            <button type="button"><img alt="google" src="/blindWeb/img/free-icon-google-play-1216729.png" width=24px>GOOGLE PLAY</button>
        </div>
        
    </div>
    
</footer>

</body>
</html>