package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beans.Employee;
import com.beans.EmployeeDetails;
import com.beans.UserPrivileges;
import com.beans.WorkSheet;
import com.dao.EmployeeDetailsDAO;

@Service
@Transactional
public class EmployeeDetailsServiceImpl implements EmployeeDetailsService {
 
    @Autowired
    private EmployeeDetailsDAO EmployeeDetailsDAO;
 
    @Override
    @Transactional
    public void addEmployeeDetails(EmployeeDetails EmployeeDetails) {
        EmployeeDetailsDAO.addEmployeeDetails(EmployeeDetails);
    }
 
    @Override
    @Transactional
    public List<EmployeeDetails> getAllEmployeeDetailss() {
        return EmployeeDetailsDAO.getAllEmployeeDetailss();
    }
 
    @Override
    @Transactional
    public void deleteEmployeeDetails(Integer EmployeeDetailsId) {
        EmployeeDetailsDAO.deleteEmployeeDetails(EmployeeDetailsId);
    }
 
    public EmployeeDetails getEmployeeDetails(int empid) {
        return EmployeeDetailsDAO.getEmployeeDetails(empid);
    }
 
    public EmployeeDetails updateEmployeeDetails(EmployeeDetails EmployeeDetails) {
        // TODO Auto-generated method stub
        return EmployeeDetailsDAO.updateEmployeeDetails(EmployeeDetails);
    }
 
    public void setEmployeeDetailsDAO(EmployeeDetailsDAO EmployeeDetailsDAO) {
        this.EmployeeDetailsDAO = EmployeeDetailsDAO;
    }

	@Override
	public EmployeeDetails validateEmpCredentials(String userName, String password) {
		return EmployeeDetailsDAO.validateEmpCredentials(userName,password);
		
	}

	@Override
	public List<UserPrivileges> getUserPrivs() {
		return EmployeeDetailsDAO.getUserPrivs();		
	}

	

	@Override
	public void addWorkSheetDetails(WorkSheet ws) {
		 EmployeeDetailsDAO.addWorkSheetDetails(ws);
	}

	@Override
	public WorkSheet getWorkSheetDetails(Integer wsId) {
		return EmployeeDetailsDAO.getWorkSheetDetails(wsId);
	}

	@Override
	public void deleteWorkSheetDetails(Integer id) {
		EmployeeDetailsDAO.deleteWorkSheetDetails(id);
	}

	@Override
	public List<WorkSheet> getAllWorkSheetDetails(String fromDate) {
		return EmployeeDetailsDAO.getAllWorkSheetDetails(fromDate);
	}
}