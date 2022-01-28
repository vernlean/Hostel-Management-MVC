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
 * Servlet implementation class UpdateComplaintStudentController
 */
@WebServlet("/UpdateComplaintStudentController")
public class UpdateComplaintStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HostelManagementDAO dao2;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateComplaintStudentController() {
        super();
        dao2 = new HostelManagementDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int stu_no = Integer.parseInt(request.getParameter("stu_no"));
		int comp_no = Integer.parseInt(request.getParameter("comp_no"));
		request.setAttribute("student", UserDAO.getStudentByStu_no(stu_no));
		request.setAttribute("complaint", HostelManagementDAO.getComplaintByComp_no(comp_no));
		RequestDispatcher view = request.getRequestDispatcher("student/update_complaint.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Complaint comp = new Complaint();
		Student student = new Student();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date parsedDate = format.parse(request.getParameter("comp_date"));
			comp.setComp_date(parsedDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		comp.setComp_no(Integer.parseInt(request.getParameter("comp_no")));
		comp.setComp_description(request.getParameter("comp_desc"));
		student.setStu_no(Integer.parseInt(request.getParameter("stu_no")));
		
		dao2.updateComplaint(comp,student);
		
		//FORWARD TO COMPLAINT STATUS
		request.setAttribute("student", UserDAO.getStudentByStu_no(student.getStu_no()));
		request.setAttribute("complaint", HostelManagementDAO.getListComplaintByStu_no(student.getStu_no()));
		RequestDispatcher view = request.getRequestDispatcher("student/complaint_status.jsp");
		view.forward(request, response);
	}

}
