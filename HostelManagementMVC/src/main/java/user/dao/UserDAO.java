package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import hostelmanagement.db.ConnectionManager;
import hostelmanagement.model.CollegeApplication;
import user.model.Student;

public class UserDAO {
	
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
	private String stu_gender;
	private String stu_email;
	private String stu_phoneno;
	private String stu_blood;
	private String stf_name;
	private String stf_pass;
	private String stf_position;
	private Date stf_birthdate;
	
	// -------- Student Operation -------- 
	
	//Login
	public static Student loginStudent(Student s) {
		stu_no = s.getStu_no();
		stu_pass = s.getStu_pass();
		
		try {
			//call getConnection()
			con = ConnectionManager.getConnection();
			System.out.println("Database connected!");
			
			//create statement
			ps = con.prepareStatement("SELECT * FROM student WHERE stu_no = ? AND stu_pass = ?");
			ps.setInt(1, stu_no);
			ps.setString(2, stu_pass);
			
			//execute query
			rs = ps.executeQuery();
			if(rs.next()) {
				s.setStu_no(rs.getInt("stu_no"));
				s.setValid(true);
			}
			else {
				s.setValid(false);
			}
			
			//close connection
			con.close();
			System.out.println("Connection closed!");
			
			}catch(SQLException e) {
				e.printStackTrace();
			}
		return s;
	}

	public static Object getStudentByStu_no(int stu_no) {
		Student student = new Student();
		try {
			//call getConnection()
			con = ConnectionManager.getConnection();
			System.out.println("Database connected!");
			
			//create statement
			ps = con.prepareStatement("SELECT * FROM student WHERE stu_no = ?");
			ps.setInt(1, stu_no);
			
			//execute query
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

			}
			System.out.println("Successful retrieve data!");
			
			//close connection
			con.close();
			System.out.println("Connection closed!");
			
			}catch(SQLException e) {
				//System.out.println(e);
				e.printStackTrace();
			}
		return student;
	}

}
