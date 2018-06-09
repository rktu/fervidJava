package com.beans;


import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="generatorLog")
public class GeneratorLog {

    
    private String id;
    private String date;
	private String time;
	private String startTime;
	private String stopTime;
	private String startKWH;
	private String stopKWH;
	private String dgRunTime;
	private String dieselStockCan;
	private String dieselStockDg;
	private String dieselPurchase;
	private String dieselConsumed;
	private String dgOnPurpose;
	private String verifiedBy;
	private String r;
	private String y;
	private String b;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getStopTime() {
		return stopTime;
	}
	public void setStopTime(String stopTime) {
		this.stopTime = stopTime;
	}
	public String getStartKWH() {
		return startKWH;
	}
	public void setStartKWH(String startKWH) {
		this.startKWH = startKWH;
	}
	public String getStopKWH() {
		return stopKWH;
	}
	public void setStopKWH(String stopKWH) {
		this.stopKWH = stopKWH;
	}
	public String getDgRunTime() {
		return dgRunTime;
	}
	public void setDgRunTime(String dgRunTime) {
		this.dgRunTime = dgRunTime;
	}
	public String getDieselStockCan() {
		return dieselStockCan;
	}
	public void setDieselStockCan(String dieselStockCan) {
		this.dieselStockCan = dieselStockCan;
	}
	public String getDieselStockDg() {
		return dieselStockDg;
	}
	public void setDieselStockDg(String dieselStockDg) {
		this.dieselStockDg = dieselStockDg;
	}
	public String getDieselPurchase() {
		return dieselPurchase;
	}
	public void setDieselPurchase(String dieselPurchase) {
		this.dieselPurchase = dieselPurchase;
	}
	public String getDieselConsumed() {
		return dieselConsumed;
	}
	public void setDieselConsumed(String dieselConsumed) {
		this.dieselConsumed = dieselConsumed;
	}
	public String getDgOnPurpose() {
		return dgOnPurpose;
	}
	public void setDgOnPurpose(String dgOnPurpose) {
		this.dgOnPurpose = dgOnPurpose;
	}
	public String getVerifiedBy() {
		return verifiedBy;
	}
	public void setVerifiedBy(String verifiedBy) {
		this.verifiedBy = verifiedBy;
	}
	public String getR() {
		return r;
	}
	public void setR(String r) {
		this.r = r;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public String getB() {
		return b;
	}
	public void setB(String b) {
		this.b = b;
	}
	

	
}
