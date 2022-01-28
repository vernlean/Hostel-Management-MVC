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

/**
 * Servlet implementation class DeleteComplaintStudentController
 */
@WebServlet("/DeleteComplaintStudentController")
public class DeleteComplaintStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HostelManagementDAO dao;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteComplaintStudentController() {
		super();
		dao = new HostelManagementDAO();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//SET VARIABLE
		int stu_no = (int) request.getSession().getAttribute("currentSessionUser");
		int comp_no = Integer.parseInt(request.getParameter("comp_no"));
		
		//DAO
		dao.deleteComplaintByComp_no(comp_no);

		//FORWARD TO COMPLAINT STATUS
		request.setAttribute("student", UserDAO.getStudentByStu_no(stu_no));
		request.setAttribute("complaint", HostelManagementDAO.getListComplaintByStu_no(stu_no));
		RequestDispatcher view = request.getRequestDispatcher("student/complaint_status.jsp");
		view.forward(request, response);
	}
}
