package day02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/div")
public class 약수서블릿 extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String su_ = req.getParameter("su");
		
		int su;
		
		if(su_ == null) {
			su =1;
		}else {
			su = Integer.parseInt(su_);
		}
		
		for(int i=1; i<=su; i++) {
			if(su % i == 0) {
				PrintWriter out = resp.getWriter();
				out.println(i);
			}
		}
	}
	
}
