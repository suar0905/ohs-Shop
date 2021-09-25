package commons;

import java.sql.*;

public class DBUtil {
	
	// (1) maria db 환경 설정 및 접속 메소드
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		
		// maria db 사용
		Class.forName("org.mariadb.jdbc.Driver");
		
		// maria db 접속
		String url = "jdbc:mariadb://127.0.01:3306/shop";
		String id ="root";
		String pw="java1004";
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
}