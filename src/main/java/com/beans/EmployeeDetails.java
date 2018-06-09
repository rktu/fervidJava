package com.beans;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "employee_details")
public class EmployeeDetails {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="emp_id")
    private Integer empId;
	
	@Column(name="emp_name")
	private String empName;
	
	@Column(name="emp_address")
	private String empAddress;
	
	@Column(name="emp_phone")
	private Integer empPhone;
	
	@Column(name="emp_username")
	private String empUsername;
	
	
	@Column(name="emp_password")
	private String empPassword	;
	
	@Column(name="created_date")
	private String createdDate;
	
	@Column(name="update_status")
	private Integer updateStatus;
	
	@Column(name="modified_date")
	private String modifiedDate;

	
	public EmployeeDetails() {
	}
	
	public EmployeeDetails(Integer empId) {
		this.empId = empId;
	}

	public EmployeeDetails(Integer empId, String empName, String empAddress, Integer empPhone, String empUsername,
			String empPassword, String createdDate, Integer updateStatus, String modifiedDate) {
		this.empId = empId;
		this.empName = empName;
		this.empAddress = empAddress;
		this.empPhone = empPhone;
		this.empUsername = empUsername;
		this.empPassword = empPassword;
		this.createdDate = createdDate;
		this.updateStatus = updateStatus;
		this.modifiedDate = modifiedDate;
	}
	
	
	
	
	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpAddress() {
		return empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	public Integer getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(Integer empPhone) {
		this.empPhone = empPhone;
	}

	public String getEmpUsername() {
		return empUsername;
	}

	public void setEmpUsername(String empUsername) {
		this.empUsername = empUsername;
	}

	public String getEmpPassword() {
		return empPassword;
	}

	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public Integer getUpdateStatus() {
		return updateStatus;
	}

	public void setUpdateStatus(Integer updateStatus) {
		this.updateStatus = updateStatus;
	}

	public String getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	

}
