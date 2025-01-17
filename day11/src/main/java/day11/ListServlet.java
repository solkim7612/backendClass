package day11;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/list")
public class ListServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int pageSize=3;
		int grpSize=5;
		int totRecord=0;
		int currentPage=1;
		
		String p_ = req.getParameter("p");		
		if( p_  != null) {
			currentPage  =  Integer.parseInt(p_);
		}
		
		AcornDAO dao=new AcornDAO();
		totRecord=dao.selectTotalCnt();
		
		ArrayList<Acorn> list=dao.selectListPaging(currentPage, pageSize);
		
		PageHandler pagehandler=new PageHandler(pageSize,grpSize,totRecord,currentPage);
		
		req.setAttribute("list", list);
		req.setAttribute("handler", pagehandler);
	
		req.getRequestDispatcher("WEB-INF/views/list2.jsp").forward(req, resp);
	}
}
