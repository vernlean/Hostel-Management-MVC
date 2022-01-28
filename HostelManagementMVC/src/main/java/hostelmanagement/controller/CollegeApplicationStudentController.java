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
import hostelmanagement.model.College;
import hostelmanagement.model.CollegeApplication;
import user.dao.UserDAO;
import user.model.Student;


/**
 * Servlet implementation class CollegeApplicationStudentController
 */
@WebServlet("/CollegeApplicationStudentController")
public class CollegeApplicationStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HostelManagementDAO dao2;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollegeApplicationStudentController() {
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
		request.setAttribute("student", UserDAO.getStudentByStu_no(stu_no));
		request.setAttribute("collegeApplication", HostelManagementDAO.getCollegeApplicationByStu_no(stu_no));
		request.setAttribute("college", HostelManagementDAO.getCollegeListByStu_no(stu_no));
		//request.setAttribute("shawl", ShawlDAO.getShawlById(pid));
		RequestDispatcher view = request.getRequestDispatcher("student/hostel_app.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CollegeApplication collap = new CollegeApplication();
		Student student = new Student();
		College coll = new College();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date parsedDate = format.parse(request.getParameter("collap_date"));
			collap.setCollap_date(parsedDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		collap.setCollap_session(request.getParameter("collap_session"));
		student.setStu_no(Integer.parseInt(request.getParameter("stu_no")));
		coll.setColl_no(request.getParameter("coll_no"));
		//add to db
		dao2.addCollegeApplication(collap,student,coll);
		//forward to menu
		//request.setAttribute("student", Integer.parseInt(request.getParameter("stu_no")));
		//System.out.println("User available: "+Integer.parseInt(request.getParameter("stu_no")));
		//request.setAttribute("collegeApplication", Integer.parseInt(request.getParameter("stu_no")));
		//request.setAttribute("college", Integer.parseInt(request.getParameter("stu_no")));
		student.setStu_no(Integer.parseInt(request.getParameter("stu_no")));
		request.setAttribute("student", UserDAO.getStudentByStu_no(student.getStu_no()));
		request.setAttribute("collegeApplication", HostelManagementDAO.getCollegeApplicationByStu_no(student.getStu_no()));
		//request.setAttribute("shawl", ShawlDAO.getShawlById(pid));
		RequestDispatcher view = request.getRequestDispatcher("student/menu_student.jsp");
		view.forward(request, response);
	}

}
