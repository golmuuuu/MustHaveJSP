package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs; 
	
	
	/* JDBC 연결 방법 1
	   자바 파일로 바로 연결하는 방법 
	   그런데 이렇게 하면 서버 이전을 하는 등 접속 정보가 바뀔 경우
	   클래스를 수정하고 다시 컴파일해야 하는 불편함이 있음
	   따라서 이렇게 연결하지는 않음   왕 비추 ~~~~~~~~~~~
	*/ 
	public JDBConnect() {
		try {
			// 드라이버 로드하기
			Class.forName("oracle.jdbc.OracleDriver");
			
			// DB연결
            String url = "jdbc:oracle:thin:@localhost:1521:xe";  
            String id = "musthave";
            String pwd = "java"; 
            con = DriverManager.getConnection(url, id, pwd); 

            System.out.println("DB 연결 성공(기본 생성자)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// JDBC 연결 방법 2
	// JSP파일에서 xml정보를 application 내장 객체를 이용해 전달 받아서 연결하는 방
	// 이렇게 하면 DB연결이 필요할 때마다 동일한 코드를 JSP파일에 계속 써야함 엥 비추 ~~~~~ 
	public JDBConnect(String driver, String url, String id, String pwd){
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("연결 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// JDBC 연결 방법 3
	// 아예 xml파일 컨텍스트 초기화 매개변수를 생성자에서 직접 가져오도록 하기
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("db연결 성공 ");
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	public void close() {
		 try {            
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close(); 

            System.out.println("JDBC 자원 해제");
        }
        catch (Exception e) {
        	e.printStackTrace();
        }
	            
	}
}
