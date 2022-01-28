package hostelmanagement.controller;

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
 * Servlet implementation class UpdateStudentController
 */
@WebServlet("/UpdateStudentController")
public class UpdateStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private UserDAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudentController() {
        super();
        dao = new UserDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int stu_no = Integer.parseInt(request.getParameter("stu_no"));
		request.setAttribute("student", UserDAO.getStudentByStu_no(stu_no));
		RequestDispatcher view = request.getRequestDispatcher("staff/update_student.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Student student = new Student();
		
		student.setStu_no(Integer.parseInt(request.getParameter("stu_no")));
		student.setStu_ic(request.getParameter("stu_ic"));
		student.setStu_name(request.getParameter("stu_name"));
		student.setStu_email(request.getParameter("stu_email"));
		student.setStu_state(request.getParameter("stu_state"));
		student.setStu_gender(request.getParameter("stu_gender"));
		student.setStu_part(Integer.parseInt(request.getParameter("stu_part")));
		student.setStu_program(request.getParameter("stu_program"));
		
		dao.UpdateStudent(student);
		
		request.setAttribute("student", UserDAO.getAllStudent());
		RequestDispatcher view = request.getRequestDispatcher("staff/list_all_student.jsp");
		view.forward(request, response);
	}

}
