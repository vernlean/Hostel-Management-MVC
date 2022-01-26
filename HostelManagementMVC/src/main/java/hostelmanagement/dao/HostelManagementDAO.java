package hostelmanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import hostelmanagement.db.ConnectionManager;
import hostelmanagement.model.College;
import hostelmanagement.model.CollegeApplication;
import hostelmanagement.model.Complaint;
import user.model.Student;

public class HostelManagementDAO {

	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement statement = null;
	static ResultSet rs = null;
	private static int stu_no;
	private int stu_ic;
	private int stu_part;
	private int stf_no;
	private String stu_name;
	private static String stu_pass;
	private String stu_program;
	private String stu_state;
	private static String stu_gender;
	private String stu_email;
	private String stu_phoneno;
	private String stu_blood;
	private String stf_name;
	private String stf_pass;
	private String stf_position;
	private Date stf_birthdate;

	//Get College Application By Student Number
	public static Object getCollegeApplicationByStu_no(int stu_no) {
		CollegeApplication collegeApplication = new CollegeApplication();
		try {
			//call getConnection()
			con = ConnectionManager.getConnection();
			System.out.println("Database connected!");

			//create statement
			ps = con.prepareStatement("SELECT * FROM college_application WHERE stu_no = ?");
			ps.setInt(1, stu_no);

			//execute query
			rs = ps.executeQuery();

			if(rs.next()) {
				collegeApplication.setCollap_no(rs.getInt("collap_no"));
				collegeApplication.setCollap_date(rs.getDate("collap_date"));
				collegeApplication.setCollap_session(rs.getString("collap_session"));
				collegeApplication.setCollap_status(rs.getString("collap_status"));
				collegeApplication.setStu_no(rs.getInt("stu_no"));
				collegeApplication.setStf_no(rs.getInt("stf_no"));
				collegeApplication.setColl_no(rs.getString("coll_no"));

				System.out.println("Successful retrieve data!");
			}
			else {
				return null;
			}


			//close connection
			con.close();
			System.out.println("Connection closed!");

		}catch(SQLException e) {
			//System.out.println(e);
			e.printStackTrace();
		}
		return collegeApplication;
	}

	//Get College by Student Number
	public static Object getCollegeByStu_no(int stu_no) {
		College college = new College();
		//CollegeApplication collegeApplication = new CollegeApplication();
		String coll_no = null;
		try {
			//call getConnection()
			con = ConnectionManager.getConnection();
			System.out.println("Database connected!");

			//create statement
			ps = con.prepareStatement("SELECT * FROM college_application WHERE stu_no = ?");
			ps.setInt(1, stu_no);

			//execute query
			rs = ps.executeQuery();

			if(rs.next()) {
				//collegeApplication.setCollap_no(rs.getInt("collap_no"));
				//collegeApplication.setColl_no(rs.getString("coll_no"));
				coll_no=rs.getString("coll_no");
			}

			//create statement
			ps = con.prepareStatement("SELECT * FROM college WHERE coll_no = ?");
			ps.setString(1, coll_no);

			//execute query
			rs = ps.executeQuery();

			if(rs.next()) {
				college.setColl_no(rs.getString("coll_no"));
				college.setColl_name(rs.getString("coll_name"));
				college.setColl_floor(Integer.parseInt(rs.getString("coll_floor")));
				college.setColl_room(Integer.parseInt(rs.getString("coll_room")));
			}

			//close connection
			con.close();
			System.out.println("Connection closed!");

		}catch(SQLException e) {
			//System.out.println(e);
			e.printStackTrace();
		}
		return college;
	}


	//Get College List By Student Number (Availability,Gender)
	public static List<College> getCollegeListByStu_no(int stu_no) {
		List<College> colleges = new ArrayList<College>();
		try {
			//Line 87-?? To find gender
			//call getConnection()
			con = ConnectionManager.getConnection();
			System.out.println("Database connected!");

			//create statement
			ps = con.prepareStatement("SELECT * FROM student WHERE stu_no = ?");
			ps.setInt(1, stu_no);

			//execute query
			rs = ps.executeQuery();

			if(rs.next()) {
				stu_gender = rs.getString("stu_gender");
			}

			if(stu_gender.equalsIgnoreCase("Male")) {
				//create statement
				Statement stmt = con.createStatement();
				String sql = "SELECT * FROM college WHERE (coll_name = 'TUN SRI LANANG A' OR coll_name = 'TUN SRI LANANG B') AND (coll_status = 'Available')";

				//execute query
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					College c = new College();
					c.setColl_no(rs.getString("coll_no"));
					colleges.add(c);
					System.out.println("Successful retrieve data!");
				}
			}

			else {
				//create statement
				Statement stmt = con.createStatement();
				String sql = "SELECT * FROM college WHERE (coll_name = 'TUN GEMALA A' OR coll_name = 'TUN GEMALA B') AND (coll_status = 'Available')";

				//execute query
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					College c = new College();
					c.setColl_no(rs.getString("coll_no"));
					colleges.add(c);
					System.out.println("Successful retrieve data!");
				}
			}

			//close connection
			con.close();
			System.out.println("Connection closed!");

		}catch(SQLException e) {
			//System.out.println(e);
			e.printStackTrace();
		}
		return colleges;
	}

	//Add college application
	public void addCollegeApplication(CollegeApplication collap, Student student, College coll) {

		java.util.Date utilDate = collap.getCollap_date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		String collap_session = collap.getCollap_session();
		String collap_status = "Processsing";
		stu_no = student.getStu_no();
		stf_no = 101;
		String coll_no = coll.getColl_no();
		String coll_status = "Unavailable";

		try {
			//Call getConnection()
			con = ConnectionManager.getConnection();

			//To insert new college application
			//Create Statement
			ps = con.prepareStatement("INSERT INTO `college_application`(`collap_date`, `collap_session`, `collap_status`, `stu_no`, `stf_no`, `coll_no`) VALUES (?,?,?,?,?,?)");
			ps.setDate(1, sqlDate);
			ps.setString(2, collap_session);
			ps.setString(3, collap_status);
			ps.setInt(4, stu_no);
			ps.setInt(5, stf_no);
			ps.setString(6, coll_no);

			//Execute Query
			ps.executeUpdate();
			System.out.println("College Application Inserted!");

			//To set college status from available to unavailable
			//Create Statement
			ps = con.prepareStatement("UPDATE `college` SET `coll_status`=? WHERE `coll_no`=?");
			ps.setString(1, coll_status);
			ps.setString(2, coll_no);

			//Execute Query
			ps.executeUpdate();
			System.out.println("College Status Updated!");

			//Close Connection
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	//Add Complaint
	public void addComplaint(Complaint comp, Student student) {
		// TODO Auto-generated method stub
		java.util.Date utilDate = comp.getComp_date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		String comp_type = comp.getComp_type();
		String comp_description = comp.getComp_description();
		String comp_status = "Processing";
		stu_no = student.getStu_no();

		try {
			//Call getConnection()
			con = ConnectionManager.getConnection();

			//To insert new college application
			//Create Statement
			ps = con.prepareStatement("INSERT INTO `complaint`(`comp_type`, `comp_date`, `comp_description`, `comp_status`, `stu_no`) VALUES (?,?,?,?,?)");
			ps.setString(1, comp_type);
			ps.setDate(2, sqlDate);
			ps.setString(3,comp_description);
			ps.setString(4,comp_status);
			ps.setInt(5, stu_no);

			//Execute Query
			ps.executeUpdate();
			System.out.println("College Application Inserted!");

			//Close Connection
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	//Get list of Complaint by student number
	public static List<Complaint> getListComplaintByStu_no(int stu_no) {
		List<Complaint> complaints = new ArrayList<Complaint>();

		try {
			//call getConnection()
			con = ConnectionManager.getConnection();
			System.out.println("Database connected!");

			//create statement
			ps = con.prepareStatement("SELECT * FROM complaint WHERE stu_no = ?");
			ps.setInt(1, stu_no);

			//execute query
			rs = ps.executeQuery();

			while(rs.next()) {
				Complaint comp = new Complaint();
				comp.setComp_no(Integer.parseInt(rs.getString("comp_no")));
				comp.setComp_type(rs.getString("comp_type"));
				comp.setComp_date(rs.getDate("comp_date"));
				comp.setComp_description(rs.getString("comp_description"));
				comp.setComp_status(rs.getString("comp_status"));

				complaints.add(comp);
				System.out.println("Successful retrieve data!");
			}

			//close connection
			con.close();
			System.out.println("Connection closed!");

		}catch(SQLException e) {
			//System.out.println(e);
			e.printStackTrace();
		}
		return complaints;
	}

	//STUDENT COMPLAINT
	//GET COMPLAINT BY COMPLAINT NUMBER 
	public static Object getComplaintByComp_no(int comp_no) {

		Complaint complaint = new Complaint();

		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();
			System.out.println("Database connected!");

			//CREATE STATEMENT
			ps = con.prepareStatement("SELECT * FROM complaint WHERE comp_no = ?");
			ps.setInt(1, comp_no);

			//EXECUTE QUERY
			rs = ps.executeQuery();
			if(rs.next()) {
				complaint.setComp_no(rs.getInt("comp_no"));
				complaint.setComp_type(rs.getString("comp_type"));
				complaint.setComp_description(rs.getString("comp_description"));
				System.out.println("Successful retrieve data!");
			}

			//CLOSE CONNECTION
			con.close();
			System.out.println("Connection closed!");

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return complaint;
	}
	//END OF COMPLAINT BY COMPLAINT NUMBER 

	//UPDATE COMPLAINT
	public void updateComplaint(Complaint comp, Student student) {

		java.util.Date utilDate = comp.getComp_date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		String comp_description = comp.getComp_description();
		int comp_no = comp.getComp_no();
		stu_no = student.getStu_no();

		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();
			System.out.println("Database connected!");

			//CREATE STATEMENT
			ps = con.prepareStatement("UPDATE complaint SET comp_date=?, comp_description=? WHERE comp_no=? AND stu_no=?");
			ps.setDate(1, sqlDate);
			ps.setString(2, comp_description);
			ps.setInt(3, comp_no);
			ps.setInt(4, stu_no);
			System.out.println("Date"+sqlDate);
			System.out.println(comp_no);
			System.out.println(comp_description);
			System.out.println(stu_no);
			//EXECUTE QUERY
			ps.executeUpdate();
			System.out.println("Successful Update data!");

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//END OF UPDATE COMPLAINT

	//DELETE COMPLAINT BY COMPLAINT NUMBER
	public void deleteComplaintByComp_no(int comp_no) {
		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();

			//CREATE STATEMENT
			ps = con.prepareStatement("DELETE FROM complaint WHERE comp_no = ?");
			ps.setInt(1, comp_no);

			//EXECUTE QUERY
			ps.executeUpdate();

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//END OF DELETE COMPLAINT BY COMPLAINT NUMBER

}
