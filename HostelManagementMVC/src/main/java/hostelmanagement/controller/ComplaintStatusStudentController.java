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
 * Servlet implementation class ComplaintStatusStudentController
 */
@WebServlet("/ComplaintStatusStudentController")
public class ComplaintStatusStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplaintStatusStudentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("student", UserDAO.getStudentByStu_no((int) request.getSession().getAttribute("currentSessionUser")));
		request.setAttribute("complaint", HostelManagementDAO.getListComplaintByStu_no((int) request.getSession().getAttribute("currentSessionUser")));
		RequestDispatcher view = request.getRequestDispatcher("student/complaint_status.jsp");
		view.forward(request, response);	
		}

}
