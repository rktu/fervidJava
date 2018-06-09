package com.beans;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "work_sheet")
public class WorkSheet {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
    private Integer wsId;
	
	
	@Column(name="emp_name")
	private String empName;
	
	@Column(name="sun_day")
	private String sunDay;
	
	@Column(name="mon_day")
	private String monDay;
	
	@Column(name="tue_day")
	private String tueDay;
	
	
	@Column(name="wed_day")
	private String wedDay	;
	
	@Column(name="thu_day")
	private String thuDay;
	
	@Column(name="fri_day")
	private String friDay;
	
	@Column(name="sat_day")
	private String satDay;

	@Column(name="created_date")
	private String createdDate;

	
	public WorkSheet() {
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getSunDay() {
		return sunDay;
	}
	public void setSunDay(String sunDay) {
		this.sunDay = sunDay;
	}
	public String getMonDay() {
		return monDay;
	}
	public void setMonDay(String monDay) {
		this.monDay = monDay;
	}
	public String getTueDay() {
		return tueDay;
	}
	public void setTueDay(String tueDay) {
		this.tueDay = tueDay;
	}
	public String getWedDay() {
		return wedDay;
	}
	public void setWedDay(String wedDay) {
		this.wedDay = wedDay;
	}
	public String getThuDay() {
		return thuDay;
	}
	public void setThuDay(String thuDay) {
		this.thuDay = thuDay;
	}
	public String getFriDay() {
		return friDay;
	}
	public void setFriDay(String friDay) {
		this.friDay = friDay;
	}
	public String getSatDay() {
		return satDay;
	}
	public void setSatDay(String satDay) {
		this.satDay = satDay;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public Integer getWsId() {
		return wsId;
	}
	public void setWsId(Integer wsId) {
		this.wsId = wsId;
	}	
}
