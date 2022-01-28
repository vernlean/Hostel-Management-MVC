package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import hostelmanagement.db.ConnectionManager;
import user.model.Staff;
import user.model.Student;

public class UserDAO {

	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement statement = null;
	static ResultSet rs = null;
	private static int stu_no;
	private String stu_ic;
	private int stu_part;
	private static int stf_no;
	private String stu_name;
	private static String stu_pass;
	private String stu_program;
	private String stu_state;
	private String stu_gender;
	private String stu_email=null;
	private String stu_phoneno;
	private String stu_blood;
	private String stf_name;
	private static String stf_pass;
	private String stf_position;
	private Date stf_birthdate;

	// -------- STUDENT METHOD -------- 

	//LOGIN STUDENT
	public static Student loginStudent(Student s) {
		
		stu_no = s.getStu_no();
		stu_pass = s.getStu_pass();

		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();

			//CREATE STATEMENT
			ps = con.prepareStatement("SELECT * FROM student WHERE stu_no = ? AND stu_pass = ?");
			ps.setInt(1, stu_no);
			ps.setString(2, stu_pass);

			//EXECUTE QUERY
			rs = ps.executeQuery();
			if(rs.next()) {
				s.setStu_no(rs.getInt("stu_no"));
				s.setValid(true);
			}
			else {
				s.setValid(false);
			}

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	//END OF LOGIN STUDENT

	//GET STUDENT BY STUDENT NUMBER
	public static Object getStudentByStu_no(int stu_no) {
		
		Student student = new Student();
		
		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();

			//CREATE STATEMENT
			ps = con.prepareStatement("SELECT * FROM student WHERE stu_no = ?");
			ps.setInt(1, stu_no);

			//EXECUTE QUERY
			rs = ps.executeQuery();

			if(rs.next()) {
				student.setStu_no(rs.getInt("stu_no"));
				student.setStu_name(rs.getString("stu_name"));
				student.setStu_ic(rs.getString("stu_ic"));
				student.setStu_gender(rs.getString("stu_gender"));
				student.setStu_program(rs.getString("stu_program"));
				student.setStu_state(rs.getString("stu_state"));
				student.setStu_part(rs.getInt("stu_part"));
				student.setStu_email(rs.getString("stu_email"));
				student.setStu_phoneno(rs.getString("stu_phoneno"));
				student.setStu_blood(rs.getString("stu_blood"));

			}

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return student;
	}
	//END OF GET STUDENT BY STUDENT NUMBER

	//TO CHANGE STUDENT PASSWORD
	public void ChangeStudentPassword(Student student, String new_pass) {
		stu_no = student.getStu_no();
		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();

			//CREATE STATEMENT
			ps = con.prepareStatement("UPDATE student SET stu_pass=? WHERE stu_no=?");
			ps.setString(1, new_pass);
			ps.setInt(2, stu_no);

			//EXECUTE QUERY
			ps.executeUpdate();

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//END OF CHANGE STUDENT PASSWORD

	//TO UPDATE PROFILE STUDENT
	public void UpdateProfileStudent(Student student) {

		stu_no = student.getStu_no();
		stu_part = student.getStu_part();
		stu_email = student.getStu_email();
		stu_phoneno = student.getStu_phoneno();
		stu_blood = student.getStu_blood();
		
		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();

			//CREATE STATEMENT
			ps = con.prepareStatement("UPDATE student SET stu_part=?, stu_email=?, stu_phoneno=?, stu_blood=? WHERE stu_no=?");
			ps.setInt(1, stu_part);
			ps.setString(2, stu_email);
			ps.setString(3, stu_phoneno);
			ps.setString(4, stu_blood);
			ps.setInt(5, stu_no);
			//EXECUTE QUERY
			ps.executeUpdate();

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//END OF UPDATE PROFILE STUDENT
	// -------- STUDENT METHOD END -------- 

	// -------- STAFF METHOD -------- 
	//LOGIN STAFF
	public static Staff loginStaff(Staff s) {

		stf_no = s.getStf_no();
		stf_pass = s.getStf_pass();

		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();

			//CREATE STATEMENT
			ps = con.prepareStatement("SELECT * FROM staff WHERE stf_no = ? AND stf_pass = ?");
			ps.setInt(1, stf_no);
			ps.setString(2, stf_pass);

			//EXECUTE QUERY
			rs = ps.executeQuery();
			if(rs.next()) {
				s.setStf_no(rs.getInt("stf_no"));
				s.setValid(true);
			}
			else {
				s.setValid(false);
			}

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	//END OF LOGIN STAFF

	//GET STAFF BY STAFF NUMBER
	public static Object getStaffByStf_no(int stf_no) {

		Staff staff = new Staff();
		
		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();

			//CREATE STATEMENT
			ps = con.prepareStatement("SELECT * FROM staff WHERE stf_no = ?");
			ps.setInt(1, stf_no);

			//EXECUTE QUERY
			rs = ps.executeQuery();

			if(rs.next()) {
				staff.setStf_no(rs.getInt("stf_no"));
				staff.setStf_name(rs.getString("stf_name"));
				staff.setStf_position(rs.getString("stf_position"));
				staff.setStf_birthdate(rs.getDate("stf_birthdate"));
			}

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return staff;
	}
	//END OF GET STAFF BY STAFF NUMBER

	//GET ALL STUDENT
	public static List<Student> getAllStudent() {

		List<Student> students = new ArrayList<Student>();

		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();

			//CREATE STATEMENT
			ps = con.prepareStatement("SELECT * FROM student");

			//EXECUTE QUERY
			rs = ps.executeQuery();

			while(rs.next()) {
				Student stud = new Student();
				stud.setStu_no(rs.getInt("stu_no"));
				stud.setStu_name(rs.getString("stu_name"));
				stud.setStu_ic(rs.getString("stu_ic"));
				stud.setStu_program(rs.getString("stu_program"));
				stud.setStu_state(rs.getString("stu_state"));
				stud.setStu_part(rs.getInt("stu_part"));
				stud.setStu_gender(rs.getString("stu_gender"));
				stud.setStu_email(rs.getString("stu_email"));
				stud.setStu_phoneno(rs.getString("stu_phoneno"));
				stud.setStu_blood(rs.getString("stu_blood"));
				students.add(stud);
			}

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
		return students;
	}
	//END OF GET ALL STUDENT

	//DELETE STUDENT
	public void deleteStudent(int stu_no) {

		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();

			//DELETE COMPLAINT IF EXIST
			//CREATE STATEMENT
			ps = con.prepareStatement("DELETE complaint FROM complaint INNER JOIN student ON complaint.stu_no = student.stu_no AND student.stu_no =?");
			ps.setInt(1, stu_no);

			//EXECUTE QUERY
			ps.executeUpdate();

			//DELETE COLLEGE APPLICATION IF EXIST
			//CREATE STATEMENT
			ps = con.prepareStatement("DELETE college_application FROM college_application INNER JOIN student ON college_application.stu_no = student.stu_no AND student.stu_no =?");
			ps.setInt(1, stu_no);

			//EXECUTE QUERY
			ps.executeUpdate();

			//DELETE STUDENT
			//CREATE STATEMENT
			ps = con.prepareStatement("DELETE FROM student WHERE stu_no=?");
			ps.setInt(1, stu_no);

			//EXECUTE QUERY
			ps.executeUpdate();

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//END OF DELETE STUDENT

	//ADD NEW STUDENT
	public void addStudent(Student student) {
		
		stu_no = student.getStu_no();
		stu_ic = student.getStu_ic();
		stu_name = student.getStu_name();
		stu_email = student.getStu_email();
		stu_state = student.getStu_state();
		stu_gender = student.getStu_gender();
		stu_part = student.getStu_part();
		stu_program = student.getStu_program();
		
		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();

			//CREATE STATEMENT
			ps = con.prepareStatement("INSERT INTO `student`(`stu_no`, `stu_name`, `stu_ic`, `stu_pass`, `stu_program`, `stu_state`, `stu_part`, `stu_gender`, `stu_email`, `stu_phoneno`, `stu_blood`) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, stu_no);
			ps.setString(2,stu_name);
			ps.setString(3,stu_ic);
			ps.setString(4,stu_ic);
			ps.setString(5,stu_program);
			ps.setString(6,stu_state);
			ps.setInt(7,stu_part);
			ps.setString(8,stu_gender);
			ps.setString(9,stu_email);
			ps.setString(10,null);
			ps.setString(11,null);

			//EXECUTE QUERY
			ps.executeUpdate();

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//END OF ADD NEW STUDENT

	//UPDATE STUDENT
	public void UpdateStudent(Student student) {

		stu_no = student.getStu_no();
		stu_ic = student.getStu_ic();
		stu_name = student.getStu_name();
		stu_email = student.getStu_email();
		stu_state = student.getStu_state();
		stu_gender = student.getStu_gender();
		stu_part = student.getStu_part();
		stu_program = student.getStu_program();
		
		try {
			//CONNECT TO DB
			con = ConnectionManager.getConnection();

			//CREATE STATEMENT
			ps = con.prepareStatement("UPDATE `student` SET `stu_name`=?,`stu_ic`=?,`stu_program`=?,`stu_state`=?,`stu_part`=?,`stu_gender`=?,`stu_email`=? WHERE stu_no=?");
			ps.setString(1,stu_name);
			ps.setString(2,stu_ic);
			ps.setString(3,stu_program);
			ps.setString(4,stu_state);
			ps.setInt(5,stu_part);
			ps.setString(6,stu_gender);
			ps.setString(7,stu_email);
			ps.setInt(8, stu_no);
			
			//EXECUTE QUERY
			ps.executeUpdate();

			//CLOSE CONNECTION
			con.close();

		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	//END OF UPDATE STUDENT
}
