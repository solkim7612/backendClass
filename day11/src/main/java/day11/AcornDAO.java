package day11;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AcornDAO {
	String driver = "oracle.jdbc.driver.OracleDriver" ;
	String url="jdbc:oracle:thin:@localhost:1521:testdb";
	String user="scott";
	String password="tiger";
	Connection con = null;
	
	private Connection dbCon() {		
		Connection con=null;
		
		try {
			Class.forName(driver);
			con =DriverManager.getConnection(url, user, password);
			if( con != null) { System.out.println("db ok");}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
	
	//페이징 리스트 구하기
	public ArrayList<Acorn> selectListPaging( int currentPage  ,  int pageSize){  //1 ,   10
		 Connection con  = dbCon();
		
		 int start=11;
		 int end=20;
		 
		 start=(currentPage-1)*pageSize+1;
		 end=currentPage*pageSize;
		 
		 String sql=" select * "
		 		+ " from "
		 		+ " (select rownum num, id, pw, name from acorntbl) "
		 		+ " where  num  between ?  and  ? ";   //페이징쿼리 작성 
		 
		System.out.println( sql );
		
	
		ArrayList<Acorn> list = new ArrayList<>();
		try {
			PreparedStatement  pst  =con.prepareStatement(sql);
			pst.setInt(1,  start);
			pst.setInt(2, end);
			ResultSet   rs  =pst.executeQuery();
			
			while( rs.next()) {
				
				String id  = rs.getString(1);
				String pw  = rs.getString(2);
				String name  = rs.getString(3);
				Acorn acorn = new Acorn( id, pw, name);
				list.add(acorn);				
			}			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return list; 
	}
	
	//전체 레코드 수 구하기
	public int selectTotalCnt() {
		Connection con=dbCon();
		String sql="select count (*) from acorntbl";
		int rowTotalCnt=0;
		
		try {
			
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
		
			if(rs.next()) {
				rowTotalCnt=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rowTotalCnt;
	}

}
