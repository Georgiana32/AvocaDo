package net.javaguides.login.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.javaguides.login.bean.Login;
import net.javaguides.login.dao.LoginDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Login login = new Login();
		login.setEmail(email);
		login.setPassword(password);

		LoginDao loginDao = new LoginDao();
		
		

		try {
			String userValidate = loginDao.authenticateUser(login, request);

			System.out.println("uservalidate = "+userValidate);
			if (userValidate.equals("Admin_Role")) {
				System.out.println("Admin's Home");

				HttpSession session = request.getSession(); // creating a session
				session.setMaxInactiveInterval(10 * 600);
				session.setAttribute("role", "Admin");
				request.setAttribute("email", email);
				request.getRequestDispatcher("profile").forward(request, response);
			} else if (userValidate.equals("User_Role")) {
				System.out.println("User's Home");

				HttpSession session = request.getSession();
				session.setMaxInactiveInterval(10 * 60);
				session.setAttribute("role", "User");
				request.setAttribute("email", email);

				request.getRequestDispatcher("profile").forward(request, response);
			} else {
				System.out.println("Error message = " + userValidate);
				request.setAttribute("errMessage", userValidate);

				request.getRequestDispatcher("LogIn.jsp").forward(request, response);
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
}
