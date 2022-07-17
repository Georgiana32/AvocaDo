package net.javaguides.registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.javaguides.course.bean.CourseBean;
import net.javaguides.registration.model.User;
import net.javaguides.user.bean.UserBean;

public class UserDao {
	public int registerUser(User user) throws ClassNotFoundException{
		String INSERT_USERS_SQL = "INSERT INTO users (name, country, age, email, password, number) VALUES (?, ?, ?, ?, ?, ?);";
		
		int result = 0;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println(user);
		
		try(Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/avocado?useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "662332");
				
				//Step 2: Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
				preparedStatement.setString(1, user.getName());
				preparedStatement.setString(2, user.getCountry());
				preparedStatement.setInt(3, user.getAge());
				preparedStatement.setString(4, user.getEmail());
				preparedStatement.setString(5, user.getPassword());
				preparedStatement.setString(6, user.getNumber());
				
				System.out.println(preparedStatement);
				//Step 3: Execute the query or update query
				result = preparedStatement.executeUpdate();
				System.out.println(result);
		}catch (SQLException e) {
			//process sql exception
			e.printStackTrace();
		}
		return result;
	} 
	
	public UserBean selectUser(int id) throws ClassNotFoundException {
		String SELECT_USER = "SELECT * FROM USERS WHERE ID = ?";
		UserBean user = new UserBean();
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Select USer");
		try(Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/avocado?useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "662332");	
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER)) {
			preparedStatement.setInt(1, id);
			
			System.out.println(preparedStatement);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString("name");
				String country = rs.getString("country");
				String ageString = rs.getString("age");
				int age =  Integer.parseInt(ageString);
				String email = rs.getString("email");
				String numberString = rs.getString("number");
				int number = Integer.parseInt(numberString);

				user = new UserBean( name,  email,  country,  age,  number);
			}
		}catch(SQLException e) {
			printSQLException(e);
		}
		return user;
	}
	
	private void printSQLException(SQLException ex) {
		for(Throwable e: ex) {
			if(e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while(t != null) {
					System.err.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
