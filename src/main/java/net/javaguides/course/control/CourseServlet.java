package net.javaguides.course.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.javaguides.course.bean.CourseBean;
import net.javaguides.course.dao.CourseDao;
import net.javaguides.review.bean.Review;
import net.javaguides.review.dao.ReviewDao;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/course/*")
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CourseDao courseDAO;
       
    public void init() {
    	courseDAO = new CourseDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getRequestURI();
		System.out.println("doGet Course servlet "+ action);
		try {
			switch(action) {
				case "/Avocado/course/insert":
					System.out.println("insert ");
					insertCourse(request, response);
					break;
				case "/Avocado/course/new":
					showNewForm(request, response);
					break;
				case "/Avocado/course/delete":
					deleteCourse(request, response);
					break;
				case "/Avocado/course/edit":
					showEditForm(request, response);
					break;
				case "/Avocado/course/update":
					updateCourse(request, response);
					break;
				case "/Avocado/course/details":
					detailsCourse(request, response);
					break;
				case "/Avocado/course/list":
					System.out.println("LIST");
					listCourse(request, response);
					break;
			}
		}catch (SQLException ex) {
			throw new ServletException(ex);
		}
		
	}
	
	private void insertCourse(HttpServletRequest request, HttpServletResponse response)
	throws SQLException, IOException{
		System.out.println("insert course");
		String course_name = request.getParameter("course_name");
		String course_description = request.getParameter("course_description");
		String content = request.getParameter("content");
		String course_link = request.getParameter("course_link");
		String course_pic = request.getParameter("course_pic");
		System.out.println("pic= "+ course_pic);
		System.out.println("link= "+ course_link);
		CourseBean newCourse = new CourseBean(course_name, course_description, content, course_link, course_pic);
		courseDAO.insertCourse(newCourse);
		System.out.println("insert course after");
		
		response.sendRedirect("list");
	}
	
	private void listCourse(HttpServletRequest request, HttpServletResponse response)
	throws SQLException, IOException, ServletException{
		List < CourseBean > listCourse = courseDAO.selectAllCourses();
		request.setAttribute("listCourse", listCourse);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/courses.jsp");
		dispatcher.forward(request, response);
	}
	
	private void detailsCourse(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException{
				HttpSession session = request.getSession();
				if(session.getAttribute("role") == null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/LogIn.jsp");
					dispatcher.forward(request, response);
				}
				ReviewDao reviewDao = new ReviewDao();
				String idString = request.getParameter("id");
				int id =  Integer.parseInt(idString);
				CourseBean  course = courseDAO.selectCourse(id);
				List < Review > listReview = reviewDao.selectAllReviews(id);
				request.setAttribute("course", course);
				request.setAttribute("review", listReview);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/course-detail.jsp");
				dispatcher.forward(request, response);
			}
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		RequestDispatcher dispatcher = request.getRequestDispatcher("Add-course.jsp");
        dispatcher.forward(request, response);
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
	throws SQLException, ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		CourseBean existingCourse = courseDAO.selectCourse(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Add-course.jsp");
		request.setAttribute("course", existingCourse);
		dispatcher.forward(request, response);
	}
	
	private void updateCourse(HttpServletRequest request, HttpServletResponse response)
	throws SQLException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		String course_name = request.getParameter("course_name");
		String course_description = request.getParameter("course_description");
		String content = request.getParameter("content");
		String course_link = request.getParameter("course_link");
		String course_pic = request.getParameter("course_pic");
		
		CourseBean book = new CourseBean(id, course_name, course_description, content, course_link, course_pic);
		courseDAO.updateCourse(book);
		response.sendRedirect("courses.jsp");
	}
	
	private void deleteCourse(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		courseDAO.deleteCourse(id);
		response.sendRedirect("courses.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
