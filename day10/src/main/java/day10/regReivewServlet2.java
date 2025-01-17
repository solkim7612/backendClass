package day10;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/reg2")
public class regReivewServlet2 extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BufferedReader reader=req.getReader();
		
		StringBuilder build=new StringBuilder();
		String line=null;
		while(reader.readLine() != null) {
			build.append(line);
		}
		System.out.println(build.toString());
		
		
		//json객체로 변환 => 자바객체로 변환
		String bodyData=build.toString();
		
		JSONObject o =new JSONObject(bodyData);
		String id=o.getString("id");
		String content=o.getString("content");
		
		Review reivew = new Review(id, content);
		System.out.println(reivew);
		
		resp.getWriter().println("ok");
	}
}
