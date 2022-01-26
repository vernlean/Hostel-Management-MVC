package user.model;

public class Student {
	
	private int stu_no;
	private String stu_name;
	private String stu_ic;
	private String stu_pass;
	private String stu_program;
	private String stu_state;
	private int stu_part;
	private String stu_gender;
	private String stu_email;
	private String stu_phoneno;
	private String stu_blood;
	private boolean valid;
	
	public int getStu_no() {
		return stu_no;
	}
	public void setStu_no(int stu_no) {
		this.stu_no = stu_no;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_ic() {
		return stu_ic;
	}
	public void setStu_ic(String stu_ic) {
		this.stu_ic = stu_ic;
	}
	public String getStu_pass() {
		return stu_pass;
	}
	public void setStu_pass(String stu_pass) {
		this.stu_pass = stu_pass;
	}
	public String getStu_program() {
		return stu_program;
	}
	public void setStu_program(String stu_program) {
		this.stu_program = stu_program;
	}
	public String getStu_state() {
		return stu_state;
	}
	public void setStu_state(String stu_state) {
		this.stu_state = stu_state;
	}
	public int getStu_part() {
		return stu_part;
	}
	public void setStu_part(int stu_part) {
		this.stu_part = stu_part;
	}
	public String getStu_gender() {
		return stu_gender;
	}
	public void setStu_gender(String stu_gender) {
		this.stu_gender = stu_gender;
	}
	public String getStu_email() {
		return stu_email;
	}
	public void setStu_email(String stu_email) {
		this.stu_email = stu_email;
	}
	public String getStu_phoneno() {
		return stu_phoneno;
	}
	public void setStu_phoneno(String stu_phoneno) {
		this.stu_phoneno = stu_phoneno;
	}
	public String getStu_blood() {
		return stu_blood;
	}
	public void setStu_blood(String stu_blood) {
		this.stu_blood = stu_blood;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
}
