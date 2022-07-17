package net.javaguides.login.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.javaguides.login.bean.Login;
import net.javaguides.login.util.DBConnection;

public class LoginDao{
	
	public String authenticateUser(Login login,HttpServletRequest request) {
		
		String email = login.getEmail();
		String password = login.getPassword();
		
		System.out.println("auhenticateUser");
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String emailDB = "";
		String passwordDB = "";
		String roleDB = "";
		int id = 0;
		
		try {
			con = DBConnection.createConnection();
			statement = con.createStatement();
			
			resultSet = statement.executeQuery("select * from users");
			
			while(resultSet.next()) {
				emailDB = resultSet.getString("email");
				passwordDB = resultSet.getString("password");
				roleDB = resultSet.getString("id_role");
				String idString =  resultSet.getString("id");
				id =  Integer.parseInt(idString);
				HttpSession session = request.getSession();
				if(email.equals(emailDB) && password.equals(passwordDB) && roleDB.equals(String.valueOf(1))) {
					session.setAttribute("id", id);
					return "Admin_Role";
				}
				else if (email.equals(emailDB) && password.equals(passwordDB) && roleDB.equals(String.valueOf(2))) {
					session.setAttribute("id", id);
					return "User_Role";
				}
			}
		}
		catch(SQLException e) {
			System.out.println("Exception authenticate user");
			e.printStackTrace();
		}
		return "Invalid user credentials";
	}
}
