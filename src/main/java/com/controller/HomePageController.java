package com.controller;

import java.awt.event.FocusEvent;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beans.Employee;
import com.beans.EmployeeDetails;
import com.beans.GeneratorLog;
import com.beans.HtMeter;
import com.beans.MainUps;
import com.beans.User;
import com.beans.UserPrivileges;
import com.beans.WorkReport;
import com.beans.WorkReportTO;
import com.beans.WorkSheet;
import com.repository.UsersRepository;
import com.service.EmployeeDetailsService;

import antlr.StringUtils;

@Controller
public class HomePageController {
	
	@Autowired
	private UsersRepository repository;
	@Autowired
	private EmployeeDetailsService empDetailsService;
	
	public static String userName="";
	public static List<String> shiftLst=new ArrayList<String>();
	public static List<EmployeeDetails> empLst=new ArrayList<EmployeeDetails>();
	public static String fromDate;
	static {
		shiftLst.add("Shift A");
		shiftLst.add("Shift B");
		shiftLst.add("Shift C");
		shiftLst.add("Shift D");
		shiftLst.add("Shift E");
		shiftLst.add("Shift F");
		shiftLst.add("Shift G");
	}
	
	@RequestMapping("/")
	public String homeController(ModelMap model) {
			System.out.println("home Page");
	        model.addAttribute("message", "Spring MVC XML Config Example");
	        model.addAttribute("user", new User()); 
	        return "homePage";	    
	}
	@RequestMapping(value = "/validateUser",method = RequestMethod.POST)
	public @ResponseBody User validateUser(HttpServletRequest request, HttpServletResponse response) {
			User user = new User();
			EmployeeDetails validateEmp = empDetailsService.validateEmpCredentials(request.getParameter("userName"),request.getParameter("password"));
			if(validateEmp!=null) {
				user.setStatus(true);
				
			}
			return user;
	        	    
    	}
	@RequestMapping("/departMents")
	public String homePage(ModelMap model,HttpServletRequest request) {
			model.addAttribute("userName",request.getParameter("userName") );
	        model.addAttribute("user", new User());
	        userName=request.getParameter("userName") ;
	        return "departMents";	    
	}
	@RequestMapping("/showGeneratorLog")
	public String showGeneratorLog(ModelMap model) {
		
		model.addAttribute("generatorLog", new GeneratorLog());		
		return "generatorLog";	    
	}
	@RequestMapping("/saveGeneratorLog")
	public String saveGeneratorLog(@ModelAttribute("generatorLog") GeneratorLog generatorLog,ModelMap model) {
		repository.save(generatorLog);
		model.addAttribute("generatorLog", new GeneratorLog());
		model.addAttribute("success", "Record Saved Successfully...");		
		return "generatorLog";	    
	}
	
	@RequestMapping("/showMainUps")
	public String showMainUps(ModelMap model) {
		model.addAttribute("mainUps", new MainUps());		
		return "mainUps";	    
	}
	@RequestMapping("/saveMainUps")
	public String saveMainUps(@ModelAttribute("mainUps") MainUps mainUps,ModelMap model) {
		repository.save(mainUps);
		model.addAttribute("mainUps", new MainUps());
		model.addAttribute("success", "Record Saved Successfully...");		
		return "mainUps";	    
	}
	
	@RequestMapping("/showhtMeter")
	public String showhtMeter(ModelMap model) {
		model.addAttribute("htMeter", new HtMeter());		
		return "htMeter";	    
	}
	@RequestMapping("/savehtMeter")
	public String savehtMeter(@ModelAttribute("htMeter") HtMeter htMeter,ModelMap model) {
		repository.save(htMeter);
		model.addAttribute("htMeter", new HtMeter());
		model.addAttribute("success", "Record Saved Successfully...");		
		return "htMeter";	    
	}
	@RequestMapping("/logOutUser")
	public String logOutUser(ModelMap model) {
		 model.addAttribute("user", new User()); 	
		return "homePage";	    
	}
	
	/*// Work report
	
	@RequestMapping("/showWorkReport")
	public String showWorkReport(ModelMap model) {
		model.addAttribute("workReport", new WorkReport());		
		return "workReport";	    
	}*/
	@RequestMapping("/saveWorkrReport")
	public String saveWorkrReportLog(@ModelAttribute("workReport") WorkReport workReport,ModelMap model) {
		repository.save(workReport);
		model.addAttribute("workReport", new WorkReport());
		model.addAttribute("success", "Record Saved Successfully...");		
		return "workReport";	    
	}
	
	/*AJAX JQGRID CODE*/
	@RequestMapping("/showEmp")
	public String showEmployee(ModelMap model) {
		return "Table";	    
	}
	@RequestMapping(value = "/getEmpList",method = RequestMethod.GET)
	public @ResponseBody List<EmployeeDetails> getEmpList(HttpServletResponse response)
			throws Exception {
		List<EmployeeDetails> empLst = empDetailsService.getAllEmployeeDetailss();	
		for (EmployeeDetails emp : empLst) {
			if(emp.getUpdateStatus()==2) {
				emp.setEmpPassword("");
			}
		}
		return empLst;
	}
	@RequestMapping("/editEmp")
	public String editEmployee(EmployeeDetails emp) {
		EmployeeDetails empOld=empDetailsService.getEmployeeDetails(emp.getEmpId());
		emp.setUpdateStatus(empOld.getUpdateStatus());
		emp.setEmpUsername(empOld.getEmpUsername());
		emp.setEmpPassword(empOld.getEmpPassword());
		emp.setCreatedDate(empOld.getCreatedDate());		
		emp.setModifiedDate(getDate());
		empDetailsService.addEmployeeDetails(emp);
		return "Table";	    
	}
	@RequestMapping("/addEmp")
	public String addEmployee(EmployeeDetails emp) {
		emp.setEmpUsername(emp.getEmpName().trim().replaceAll("\\s+",""));
		emp.setEmpPassword(generatePassword());
		emp.setCreatedDate(getDate());
		emp.setUpdateStatus(1);
		empDetailsService.addEmployeeDetails(emp);
		return "Table";	    
	}
	@RequestMapping("/delEmp")
	public String delEmployee(Integer id) {		
		empDetailsService.deleteEmployeeDetails(id);
		return "Table";	    
	}
	@RequestMapping("/changePassword")
	public String changePassword(ModelMap model) {
		model.addAttribute("emp", new User());
		return "changePassword";	    
	}
	
	public String generatePassword() {
		 String password= RandomStringUtils.randomAscii(8);
		return password;
	}
	public String getDate() {
		String pattern = "yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		return date;
	}
	@RequestMapping("/saveNewPassword")
	public String saveNewPassword(@ModelAttribute("emp") User user,ModelMap model) {
		EmployeeDetails validateEmp = empDetailsService.validateEmpCredentials(user.getUserName(),user.getPassword());
		if(validateEmp!=null) {
			validateEmp.setUpdateStatus(2);
			validateEmp.setModifiedDate(getDate());
			validateEmp.setEmpPassword(user.getNewPassword());
			empDetailsService.addEmployeeDetails(validateEmp);
			model.addAttribute("emp", new User());
			model.addAttribute("success", "Password Changed Successfully...");	
		}
		else {
			model.addAttribute("emp", new User());
			model.addAttribute("success", "Incorrect Username/Password...");
		}			
		return "changePassword";	    
	}
	@RequestMapping("/userPrivileges")
	public String userPrivileges(ModelMap model) {
		
		List<UserPrivileges> userPrivsLst = empDetailsService.getUserPrivs();
		List<String> privs = new ArrayList<String>();
		privs.add("View");
		privs.add("Edit");
		privs.add("Add");
		privs.add("Delete");
		//System.out.println(userPrivsLst.size());
		List<String>menus=new ArrayList<String>();
		for (UserPrivileges userPrivileges : userPrivsLst) {
			menus.add(userPrivileges.getMenuName());
		}
		//Get all the users
		List<EmployeeDetails> userLst = empDetailsService.getAllEmployeeDetailss();
		
		model.addAttribute("userPrivs", new UserPrivileges());
		model.addAttribute("usersLst", userLst);
		model.addAttribute("menuLst", menus);
		model.addAttribute("privs", privs);
		return "userPrivileges";	    
	}
	@RequestMapping("/modifyUserPrivs")
	public String modifyUserPrivs(@ModelAttribute("userPrivs") UserPrivileges userPrivs,ModelMap model) {
		List<String> privs = new ArrayList<String>();
		privs.add("View");
		privs.add("Edit");
		privs.add("Add");
		privs.add("Delete");
		
		System.out.println(Arrays.toString(userPrivs.getPrivs()));
		model.addAttribute("userPrivs", new UserPrivileges());
		model.addAttribute("privs", privs);
		return "userPrivileges";	    
	}
	
//WorkSheet Related Code
	@RequestMapping("/showWorkSheet")
	public String showWorkSheet(ModelMap model,HttpServletRequest request) {
		
		fromDate=request.getParameter("fromDate");
		model.addAttribute("fromDate", fromDate);
		return "WorkSheet";	    
	}
	@RequestMapping(value = "/getWorkSheetList",method = RequestMethod.GET)
	public @ResponseBody List<WorkSheet> getWorkSheetList(HttpServletResponse response,ModelMap model)
			throws Exception {
		System.out.println(fromDate);
		if(org.apache.commons.lang.StringUtils.isBlank(fromDate))
			fromDate="";
		
		List<WorkSheet> workSheetLst = empDetailsService.getAllWorkSheetDetails(fromDate);			
		return workSheetLst;
	}
	@RequestMapping("/editWorkSheet")
	public String editWorkSheet(WorkSheet ws) {
		WorkSheet wsOld=empDetailsService.getWorkSheetDetails(ws.getWsId());
		ws.setCreatedDate(getDate());  
		empDetailsService.addWorkSheetDetails(ws);
		return "WorkSheet";	    
	}
	@RequestMapping("/addWorkSheet")
	public String addWorkSheet(WorkSheet ws) {
		ws.setCreatedDate(getDate());  
		empDetailsService.addWorkSheetDetails(ws);
		return "WorkSheet";	    
	}
	@RequestMapping("/delWorkSheet")
	public String delWorkSheet(Integer id) {		
		empDetailsService.deleteWorkSheetDetails(id);
		return "WorkSheet";	    
	}
	//WorkReport Related Code
		@RequestMapping("/showWorkReport")
		public String showWorkReport(ModelMap model,HttpServletRequest request) {			
			fromDate=request.getParameter("fromDate");
			model.addAttribute("fromDate", fromDate);
			return "WorkReport2";	    
		}
		@RequestMapping(value = "/getWorkReportList",method = RequestMethod.GET)
		public @ResponseBody List<WorkReport> getWorkReporttList(HttpServletResponse response,ModelMap model)
				throws Exception {
			if(org.apache.commons.lang.StringUtils.isBlank(fromDate))
				fromDate="";
			
			List<WorkReport> WorkReportList = repository.getAllWorkReportDetails(fromDate);
			
			return WorkReportList;
		}
		@RequestMapping("/editWorkReport")
		public String editWorkReport(WorkReport wr) {
			System.out.println("Edit-->"+wr.getId());
			repository.update(wr);
			return "WorkReport2";	    
		}
		@RequestMapping("/addWorkReport")
		public String addWorkReport(WorkReport wr,HttpServletRequest request) {
			wr.setId(repository.getNextSequenceId("autoId").toString());
			wr.setCreatedDate(System.currentTimeMillis());  
			wr.setCreatedBy(userName);
			repository.save(wr);
			return "WorkReport2";	    
		}
	
		public String dateFormatter(Long dateMillis) {
			Date date = new Date(dateMillis);
		    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    return formatter.format(date);
		}
		@RequestMapping(value = "/getWorkReportExport",method = RequestMethod.GET)
		public @ResponseBody List<WorkReportTO> getWorkReporttList1(HttpServletResponse response,ModelMap model)
				throws Exception {
			if(org.apache.commons.lang.StringUtils.isBlank(fromDate))
				fromDate="";
			
			List<WorkReport> WorkReportList = repository.getAllWorkReportDetails(fromDate);
			List<WorkReportTO> workExportLst=new ArrayList<WorkReportTO>();
			for (WorkReport to : WorkReportList) {
				WorkReportTO wto=new WorkReportTO();
				wto.setId(to.getId());
				wto.setCreatedBy(to.getCreatedBy());
				wto.setDate(to.getDate());
				wto.setName(to.getName());
				wto.setTime(to.getTime());
				wto.setShift(to.getShift());
				wto.setCreatedDate(dateFormatter(to.getCreatedDate()));
				workExportLst.add(wto);
			}
			
			return workExportLst;
		}
}
