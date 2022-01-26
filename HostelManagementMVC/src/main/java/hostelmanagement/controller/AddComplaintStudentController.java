package hostelmanagement.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hostelmanagement.dao.HostelManagementDAO;
import hostelmanagement.model.Complaint;
import user.dao.UserDAO;
import user.model.Student;

/**
 * Servlet implementation class AddComplaintStudentController
 */
@WebServlet("/AddComplaintStudentController")
public class AddComplaintStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO dao;
	private HostelManagementDAO dao2;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddComplaintStudentController() {
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
		int stu_no = Integer.parseInt(request.getParameter("stu_no"));
		request.setAttribute("student", UserDAO.getStudentByStu_no(stu_no));
		RequestDispatcher view = request.getRequestDispatcher("student/add_complaint.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Complaint comp = new Complaint();
		Student student = new Student();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date parsedDate = format.parse(request.getParameter("comp_date"));
			comp.setComp_date(parsedDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		comp.setComp_type(request.getParameter("comp_type"));
		comp.setComp_description(request.getParameter("comp_desc"));
		student.setStu_no(Integer.parseInt(request.getParameter("stu_no")));
		//add to db
		dao2.addComplaint(comp,student);
		RequestDispatcher view = request.getRequestDispatcher("student/status_complaint.jsp");
		view.forward(request, response);
	}

}
