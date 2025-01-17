package blindWeb;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/post")
public class CommentsServlet extends HttpServlet {

    private CommentsDAO commentsDAO = new CommentsDAO();
    private PostDAO postDAO = new PostDAO(); // PostDAO 인스턴스 생성

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Post ID를 파라미터로 받아서 사용
        String postId = request.getParameter("postId");
        
        if (postId == null || postId.isEmpty()) {
            postId = "240911U001"; // 기본적으로 조회할 postId, 필요에 따라 변경하세요
        }

        // 해당 postId로 게시물 정보 가져오기
        Post post = postDAO.getPostById(postId); 

        if (post == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "해당 게시물이 존재하지 않습니다.");
            return;
        }

        // 이후에만 post의 내용을 처리합니다.
        String contents = post.getPostContents();
        contents = contents.replace("\r\n", "<br>");
        contents = contents.replace("\n", "<br>");
        post.setPostContents(contents);

        // Retrieve the list of comments using the DAO
        List<Comments> commentsList = commentsDAO.getCommentsByPostId(postId);
        
        // Set the post and commentsList as request attributes
        request.setAttribute("post", post);
        request.setAttribute("comments", commentsList);
        
        // Forward the request to the JSP
        request.getRequestDispatcher("WEB-INF/views/post.jsp").forward(request, response);
    }
    


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String userId = req.getParameter("userId");
        String postUserCompany = req.getParameter("postUserCompany");
        String postDate = req.getParameter("postDate");
        String postContents = req.getParameter("postContents");

        // 콘솔에서 파라미터 값 확인
        System.out.println("User ID: " + userId);
        System.out.println("Company: " + postUserCompany);
        System.out.println("Date: " + postDate);
        System.out.println("Contents: " + postContents);

        // JSON 형식으로 댓글 데이터를 클라이언트로 보내기
        String jsonResponse = String.format(
            "{\"userId\":\"%s\", \"postUserCompany\":\"%s\", \"postDate\":\"%s\", \"postContents\":\"%s\"}",
            userId, postUserCompany, postDate, postContents
        );

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonResponse);
    }

}