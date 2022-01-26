package user.model;

import java.util.Date;

public class Staff {

	private int stf_no;
	private String stf_name;
	private String stf_pass;
	private String stf_position;
	private Date stf_birthdate;
	private boolean valid;
	
	public int getStf_no() {
		return stf_no;
	}
	public void setStf_no(int stf_no) {
		this.stf_no = stf_no;
	}
	public String getStf_name() {
		return stf_name;
	}
	public void setStf_name(String stf_name) {
		this.stf_name = stf_name;
	}
	public String getStf_pass() {
		return stf_pass;
	}
	public void setStf_pass(String stf_pass) {
		this.stf_pass = stf_pass;
	}
	public String getStf_position() {
		return stf_position;
	}
	public void setStf_position(String stf_position) {
		this.stf_position = stf_position;
	}
	public Date getStf_birthdate() {
		return stf_birthdate;
	}
	public void setStf_birthdate(Date stf_birthdate) {
		this.stf_birthdate = stf_birthdate;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
}
