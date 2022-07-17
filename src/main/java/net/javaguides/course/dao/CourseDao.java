package net.javaguides.course.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.javaguides.course.bean.CourseBean;

public class CourseDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/avocado?useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private String jdbcUsername = "root";
	private String jdbcPassword = "662332";
	
	private static final String INSERT_COURSES_SQL = "insert into course" + "(course_name, course_description, content, course_link, course_pic) VALUES" + "(?, ?, ?, ?, ?);";
	private static final String SELECT_COURSE_BY_ID = "select * from course where id = ?";
	private static final String SELECT_ALL_COURSES = "select * from course";
	private static final String DELETE_COURSES_SQL = "delete from course where id = ?;";
	private static final String UPDATE_COURSES_SQL = "update course set course_name = ?, course_description = ?, content = ?, course_link = ?, course_pic = ? where id = ?;";
	
	public CourseDao() {}
	
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
	
	public void insertCourse(CourseBean add) throws SQLException{
		
		System.out.println(INSERT_COURSES_SQL);
		
		
		try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COURSES_SQL)){
			preparedStatement.setString(1, add.getCourse_name());
			preparedStatement.setString(2, add.getCourse_description());
			preparedStatement.setString(3, add.getContent());
			preparedStatement.setString(4, add.getCourse_link());
			preparedStatement.setString(5, add.getCourse_pic());
			System.out.println(preparedStatement);
			preparedStatement.execute();
			System.out.println("After Execute");
		}catch(SQLException e) {
			printSQLException(e);
		}
		
	}
	
	public CourseBean selectCourse(int id) {
		CourseBean course = null;
		
		try(Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COURSE_BY_ID);){
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				String course_name = rs.getString("course_name");
				String course_description = rs.getString("course_description");
				String content = rs.getString("content");
				String course_link = rs.getString("course_link");
				String course_pic = rs.getString("course_pic");

				course = new CourseBean(id, course_name, course_description, content, course_link, course_pic);
			}
		}catch(SQLException e) {
			printSQLException(e);
		}
		return course;
	}
	
	public List <CourseBean> selectAllCourses() {
		
		List <CourseBean> courses = new ArrayList < > ();
		
		try(Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COURSES);){
			System.out.println(preparedStatement);
			
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String course_name = rs.getString("course_name");
				String course_description = rs.getString("course_description");
				String content = rs.getString("content");
				String course_link = rs.getString("course_link");
				String course_pic = rs.getString("course_pic");
				CourseBean cours =  new CourseBean(id, course_name, course_description, content, course_link, course_pic);
				courses.add(cours);
			}
		}catch(SQLException e) {
			printSQLException(e);
		}
		return courses;
	}
	
	public boolean deleteCourse(int id) throws SQLException{
		boolean rowDeleted;
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_COURSES_SQL);){
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
	
	public boolean updateCourse(CourseBean course) throws SQLException{
		boolean rowUpdated;
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_COURSES_SQL);){
			statement.setString(1, course.getCourse_name());
			statement.setString(2, course.getCourse_description());
			statement.setString(3, course.getContent());
			statement.setString(4, course.getCourse_link());
			statement.setString(5, course.getCourse_pic());
			statement.setInt(6, course.getId());
			
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
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




























