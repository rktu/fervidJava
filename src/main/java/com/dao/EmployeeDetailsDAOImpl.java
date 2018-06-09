package com.dao;

import java.util.List;
import java.util.Properties;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Settings;
import org.hibernate.internal.SessionFactoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beans.Employee;
import com.beans.EmployeeDetails;
import com.beans.UserPrivileges;
import com.beans.WorkSheet;

@Repository
public class EmployeeDetailsDAOImpl implements EmployeeDetailsDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    public void addEmployeeDetails(EmployeeDetails EmployeeDetails) {
    	System.out.println("Before Saving");
        sessionFactory.getCurrentSession().saveOrUpdate(EmployeeDetails);
        
    }
 
    @SuppressWarnings("unchecked")
    public List<EmployeeDetails> getAllEmployeeDetailss() {
    	return sessionFactory.getCurrentSession().createQuery("FROM EmployeeDetails")
                .list();
        
    }
 
    @Override
    public void deleteEmployeeDetails(Integer EmployeeDetailsId) {
        EmployeeDetails EmployeeDetails = (EmployeeDetails) sessionFactory.getCurrentSession().load(
                EmployeeDetails.class, EmployeeDetailsId);
        if (null != EmployeeDetails) {
            this.sessionFactory.getCurrentSession().delete(EmployeeDetails);
        }
 
    }
 
    public EmployeeDetails getEmployeeDetails(int empid) {
        return (EmployeeDetails) sessionFactory.getCurrentSession().get(
                EmployeeDetails.class, empid);
    }
 
    @Override
    public EmployeeDetails updateEmployeeDetails(EmployeeDetails EmployeeDetails) {
        sessionFactory.getCurrentSession().update(EmployeeDetails);
        return EmployeeDetails;
    }

	@Override
	public EmployeeDetails validateEmpCredentials(String userName, String password) {
		EmployeeDetails emp=(EmployeeDetails) sessionFactory.getCurrentSession().createQuery("FROM EmployeeDetails WHERE empUsername=? AND empPassword=?")
		.setParameter(0, userName).setParameter(1,password).uniqueResult();
		return emp;
	}

	@Override
	public List<UserPrivileges> getUserPrivs() {
		return sessionFactory.getCurrentSession().createQuery("FROM UserPrivileges")
                .list();
	}

	@Override
	public List<WorkSheet> getAllWorkSheetDetails(String fromDate) {
		return sessionFactory.getCurrentSession().createQuery("FROM WorkSheet WHERE createdDate LIKE ?")
				.setParameter(0, "%"+fromDate+"%")
                .list();
	}

	@Override
	public void addWorkSheetDetails(WorkSheet ws) {
        sessionFactory.getCurrentSession().saveOrUpdate(ws);

	}

	@Override
	public WorkSheet getWorkSheetDetails(Integer wsId) {
		return (WorkSheet) sessionFactory.getCurrentSession().get(
				WorkSheet.class, wsId);
	}

	@Override
	public void deleteWorkSheetDetails(Integer id) {
		WorkSheet WorkSheetDetails = (WorkSheet) sessionFactory.getCurrentSession().load(
				WorkSheet.class, id);
	        if (null != WorkSheetDetails) {
	            this.sessionFactory.getCurrentSession().delete(WorkSheetDetails);
	        }
	}
 
}