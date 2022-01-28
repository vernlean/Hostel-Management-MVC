package user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.dao.UserDAO;
import user.model.Student;

/**
 * Servlet implementation class ManageProfileStudentController
 */
@WebServlet("/ManageProfileStudentController")
public class ManageProfileStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageProfileStudentController() {
        super();
        dao = new UserDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int stu_no = (int) request.getSession().getAttribute("currentSessionUser");
		request.setAttribute("student", UserDAO.getStudentByStu_no(stu_no));
		RequestDispatcher view = request.getRequestDispatcher("student/manage_profile.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		Student student = new Student();

		//CONDITION IF CHANGE PASSWORD
		if (action.equalsIgnoreCase("change_pass")) {
			//TO CHANGE PASSWORD
			student.setStu_no((int) request.getSession().getAttribute("currentSessionUser"));
			student.setStu_pass(request.getParameter("current_pass"));
			String new_pass = request.getParameter("new_pass");
			//CHECK CURRENT PASSWORD
			student = UserDAO.loginStudent(student);
			//IF PASSWORD VALID
			if(student.isValid()) {
				//CHANGE PASSWORD
				dao.ChangeStudentPassword(student,new_pass);
				student.setStu_pass(new_pass);
			}
		}
		//CONDITION IF UPDATE PROFILE
		if (action.equalsIgnoreCase("update_profile")) {
			//TO UPDATE PROFILE
			student.setStu_no((int) request.getSession().getAttribute("currentSessionUser"));
			student.setStu_part(Integer.parseInt(request.getParameter("stu_part")));
			student.setStu_email(request.getParameter("stu_email"));
			student.setStu_phoneno(request.getParameter("stu_phoneno"));
			student.setStu_blood(request.getParameter("stu_blood"));
			//UPDATE PROFILE
			dao.UpdateProfileStudent(student);
		}
		//FORWARD TO MANAGE PROFILE
		request.setAttribute("student", UserDAO.getStudentByStu_no(student.getStu_no()));
		RequestDispatcher view = request.getRequestDispatcher("student/manage_profile.jsp");
		view.forward(request, response);
	}

}
