package net.javaguides.login.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection createConnection()
	{
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/avocado?useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		String username = "root";
		String password = "662332";
		
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			}
			catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, username, password);
			System.out.println("Post establishing a DB connection - " + con);
		}
		catch(SQLException e) {
			System.out.println("An error occurred. Maybe user/password is invalid");
			e.printStackTrace();
		}
		return con;
	}

}
