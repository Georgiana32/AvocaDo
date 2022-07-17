package net.javaguides.review.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.javaguides.course.bean.CourseBean;
import net.javaguides.review.bean.Review;

public class ReviewDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/avocado?useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private String jdbcUsername = "root";
	private String jdbcPassword = "662332";
	
	private static final String INSERT_REVIEW_SQL = "insert into review" + "(user_id, course_id, review_text) VALUES" + "(?, ?, ?);";
	private static final String SELECT_ALL_REVIEW = "select  user_id, users.name as user_name, review_text from review, users where course_id = ? and users.id = user_id";
	
	public ReviewDao() {}
	
	protected Connection getConnection() {
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		return connection;
}
	
	public void insertReview(Review add) throws SQLException{
		
		System.out.println(INSERT_REVIEW_SQL);
		
		
		try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REVIEW_SQL)){
			preparedStatement.setInt(1, add.getUser_id());
			preparedStatement.setInt(2, add.getCourse_id());
			preparedStatement.setString(3, add.getReview_text());
			System.out.println(preparedStatement);
			System.out.println("test");
			preparedStatement.execute();
			System.out.println("After Execute");
		}catch(SQLException e) {
			printSQLException(e);
		}
		
	}
	

	public List <Review> selectAllReviews(int id_course) {
		
		List <Review> reviews = new ArrayList < > ();
		
		try(Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_REVIEW);){
			preparedStatement.setInt(1, id_course);
			System.out.println(preparedStatement);
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				int user_id = rs.getInt("user_id");
				String user_name = rs.getString("user_name");
				String review_text = rs.getString("review_text");
				System.out.println("review from db "+ user_name);
				Review review =  new Review(user_id, review_text, user_name);
				reviews.add(review);
			}
		}catch(SQLException e) {
			printSQLException(e);
		}
		return reviews;
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
