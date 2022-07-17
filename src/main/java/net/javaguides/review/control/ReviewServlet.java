package net.javaguides.review.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.course.bean.CourseBean;
import net.javaguides.course.dao.CourseDao;
import net.javaguides.review.bean.Review;
import net.javaguides.review.dao.ReviewDao;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/review/*")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ReviewDao reviewDao;
    
    public void init() {
    	reviewDao = new ReviewDao();
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getRequestURI();
		System.out.println("doGet REVIEW servlet "+ action);
		try {
			switch(action) {
				case "/Avocado/review/insert":
					System.out.println("insert dsadsadasd");
					insertReview(request, response);
					break;
				case "/Avocado/review/list":
					System.out.println("LIST");
					listReview(request, response);
					break;
			}
		}catch (SQLException ex) {
			throw new ServletException(ex);
		}
		
	}
	
	private void insertReview(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException{
				System.out.println("insert review");
				
				String user_idString = request.getParameter("userId");
				request.getParameter(user_idString);
				int user_id =  Integer.parseInt(user_idString);
				String course_idString  = request.getParameter("courseId");
				int course_id =  Integer.parseInt(course_idString);
				String review_text = request.getParameter("review_text");
				System.out.println(user_id+" "+ course_id+" "+review_text);
				
				Review newReview = new Review(user_id, course_id, review_text);
				reviewDao.insertReview(newReview);
				System.out.println("insert review after");
				
				response.sendRedirect("/Avocado/course/details?id="+course_id);
			}
	
	private List<Review> listReview(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException{
				String idString = request.getParameter("courseId");
				int id =  Integer.parseInt(idString);
				List < Review > listReview = reviewDao.selectAllReviews(id);
				return listReview;
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
