package prac;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import day03.Acorn;

public class Test2 {

	public static void main(String[] args) {
		//ArrayList<Acorn>
		
//		ArrayList<Acorn> list=new ArrayList<>();
//		list.add(new Acorn("a01", "1234","가"));
//		list.add(new Acorn("a02", "1234","나"));
//		list.add(new Acorn("a03", "1234","다"));
//		
//		for(Acorn acorn: list)
//			System.out.println(acorn);
		
		
		//라이브러리 odjbc8.jar => WEB-INF/lib
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:testdb";
		String user = "scott";
		String password = "tiger";
		
		ArrayList<Acorn> list =new ArrayList<>();
		
		//1.
		try {
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url, user, password);
			String sql="select*from acorntbl";
			PreparedStatement pst=con.prepareStatement(sql);
			
			//조회  <> 등록,변경,삭제 executeUpdate()
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
				String id=rs.getString(1);
				String pw=rs.getString(2);
				String name=rs.getString(3);
				
				Acorn acorn=new Acorn (id, pw, name);
				list.add(acorn);
			}
			
			rs.close();
			pst.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(int i=0; i<list.size(); i++) {
			Acorn a=list.get(i);
			System.out.println(a);
		}
		
	}

}