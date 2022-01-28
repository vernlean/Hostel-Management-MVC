package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import user.dao.UserDAO;
import user.model.Staff;

/**
 * Servlet implementation class LoginStaffController
 */
@WebServlet("/LoginStaffController")
public class LoginStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginStaffController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Staff s = new Staff();
		s.setStf_no(Integer.parseInt(request.getParameter("stf_no")));
		s.setStf_pass(request.getParameter("stf_pass"));
		
		//LOGIN
		s = UserDAO.loginStaff(s);
		//CHECK IF STAFF VALID
		if(s.isValid())
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("currentSessionUser", s.getStf_no());
			request.setAttribute("staff", UserDAO.getStaffByStf_no(s.getStf_no()));
			//FORWARD TO STAFF PAGE
			RequestDispatcher view = request.getRequestDispatcher("staff/menu_staff.jsp");
			view.forward(request, response);
		}
		else 
		{
			JOptionPane.showMessageDialog(null, "Please enter a valid Staff No & Password", "Error Occurred", JOptionPane.WARNING_MESSAGE);
			response.sendRedirect("staff/signin_staff.jsp");
		}
	}
}
