package hostelmanagement.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hostelmanagement.dao.HostelManagementDAO;
import user.dao.UserDAO;
import user.model.Student;

/**
 * Servlet implementation class StudentMenuController
 */
@WebServlet("/StudentMenuController")
public class StudentMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO dao;
	private HostelManagementDAO dao2;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentMenuController() {
        super();
        dao = new UserDAO();
        dao2 = new HostelManagementDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Student s = new Student();
		//s.setStu_no(Integer.parseInt(request.getParameter("stu_no")));
		request.setAttribute("student", UserDAO.getStudentByStu_no(Integer.parseInt(request.getParameter("stu_no"))));
		request.setAttribute("collegeApplication", HostelManagementDAO.getCollegeApplicationByStu_no(Integer.parseInt(request.getParameter("stu_no"))));
		RequestDispatcher view = request.getRequestDispatcher("student/menu_student.jsp");
		view.forward(request, response);
	}



}
