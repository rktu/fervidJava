package com.beans;


import org.springframework.data.mongodb.core.mapping.Document;
// creating new document collection 
// if any feild add to the application need add fist here 
// pojo --plane old java object
// this is designed in the top of Spring MVC

@Document(collection="htMeter")
public class HtMeter {
	
	private String id;
	private String date;
	private String time;
	private String kwh;
	private String kwhConsumption;
	private String kvah;
	private String kvahConsumption;
	private String kvarh;
	private String KvarhConsumption;
	private String md;
	private String pf;
	private String verifiedBy;
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getKwh() {
		return kwh;
	}
	public void setKwh(String kwh) {
		this.kwh = kwh;
	}
	public String getKwhConsumption() {
		return kwhConsumption;
	}
	public void setKwhConsumption(String kwhConsumption) {
		this.kwhConsumption = kwhConsumption;
	}
	public String getKvah() {
		return kvah;
	}
	public void setKvah(String kvah) {
		this.kvah = kvah;
	}
	public String getKvahConsumption() {
		return kvahConsumption;
	}
	public void setKvahConsumption(String kvahConsumption) {
		this.kvahConsumption = kvahConsumption;
	}
	public String getKvarh() {
		return kvarh;
	}
	public void setKvarh(String kvarh) {
		this.kvarh = kvarh;
	}
	public String getKvarhConsumption() {
		return KvarhConsumption;
	}
	public void setKvarhConsumption(String kvarhConsumption) {
		KvarhConsumption = kvarhConsumption;
	}
	public String getMd() {
		return md;
	}
	public void setMd(String md) {
		this.md = md;
	}
	public String getPf() {
		return pf;
	}
	public void setPf(String pf) {
		this.pf = pf;
	}
	public String getVerifiedBy() {
		return verifiedBy;
	}
	public void setVerifiedBy(String verifiedBy) {
		this.verifiedBy = verifiedBy;
	}
	
	
	
	

	
}
