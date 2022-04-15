package DBcon;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBcon {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String id = "system";
		String pw = "1234";
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		return conn;
	}
}