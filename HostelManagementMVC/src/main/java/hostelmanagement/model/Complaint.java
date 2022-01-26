package hostelmanagement.model;

import java.util.Date;

public class Complaint {
	
	private int comp_no;
	private String comp_type;
	private Date comp_date;
	private String comp_description;
	private String comp_status;
	private int stu_no;
	
	public int getComp_no() {
		return comp_no;
	}
	public void setComp_no(int comp_no) {
		this.comp_no = comp_no;
	}
	public String getComp_type() {
		return comp_type;
	}
	public void setComp_type(String comp_type) {
		this.comp_type = comp_type;
	}
	public Date getComp_date() {
		return comp_date;
	}
	public void setComp_date(Date comp_date) {
		this.comp_date = comp_date;
	}
	public String getComp_description() {
		return comp_description;
	}
	public void setComp_description(String comp_description) {
		this.comp_description = comp_description;
	}
	public String getComp_status() {
		return comp_status;
	}
	public void setComp_status(String comp_status) {
		this.comp_status = comp_status;
	}
	public int getStu_no() {
		return stu_no;
	}
	public void setStu_no(int stu_no) {
		this.stu_no = stu_no;
	}
	
	
}
