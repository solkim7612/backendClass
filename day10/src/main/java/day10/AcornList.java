package day10;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Acornlist")
public class AcornList extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AcornService service = new AcornService();
		ArrayList<Acorn> list=service.getList();
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("WEB-INF/views/list2.jsp").forward(req, resp);
	}
}
