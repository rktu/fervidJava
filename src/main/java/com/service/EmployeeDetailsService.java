package com.service;

import java.util.List;

import com.beans.Employee;
import com.beans.EmployeeDetails;
import com.beans.UserPrivileges;
import com.beans.WorkSheet;

public interface EmployeeDetailsService {

	public void addEmployeeDetails(EmployeeDetails EmployeeDetails);

	public List<EmployeeDetails> getAllEmployeeDetailss();

	public void deleteEmployeeDetails(Integer EmployeeDetailsId);

	public EmployeeDetails getEmployeeDetails(int EmployeeDetailsid);

	public EmployeeDetails updateEmployeeDetails(EmployeeDetails EmployeeDetails);

	public EmployeeDetails validateEmpCredentials(String userName, String password);
	
	public List<UserPrivileges> getUserPrivs();

	public List<WorkSheet> getAllWorkSheetDetails(String fromDate);

	public void addWorkSheetDetails(WorkSheet ws);

	public WorkSheet getWorkSheetDetails(Integer wsId);

	public void deleteWorkSheetDetails(Integer id);
}