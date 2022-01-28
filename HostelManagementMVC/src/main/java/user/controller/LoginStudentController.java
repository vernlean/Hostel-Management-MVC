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

import hostelmanagement.dao.HostelManagementDAO;
import user.dao.UserDAO;
import user.model.Student;

/**
 * Servlet implementation class LoginStudentController
 */
@WebServlet("/LoginStudentController")
public class LoginStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginStudentController() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Student s = new Student();
		s.setStu_no(Integer.parseInt(request.getParameter("stu_no")));
		s.setStu_pass(request.getParameter("stu_pass"));
		
		s = UserDAO.loginStudent(s);
		if(s.isValid())
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("currentSessionUser", s.getStu_no());
			request.setAttribute("student", UserDAO.getStudentByStu_no(s.getStu_no()));
			request.setAttribute("collegeApplication", HostelManagementDAO.getCollegeApplicationByStu_no(s.getStu_no()));
			//forward to student page
			RequestDispatcher view = request.getRequestDispatcher("student/menu_student.jsp");
			view.forward(request, response);
		}
		else 
		{
			JOptionPane.showMessageDialog(null, "Please enter a valid Student No & Password", "Error Occurred", JOptionPane.WARNING_MESSAGE);
			response.sendRedirect("student/signin_student.jsp");
		}
	}

}
