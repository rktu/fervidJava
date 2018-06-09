package com.beans;


import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="mainUps")
public class MainUps {

    
    private String id;
    private String date;


	private String time;
	private String startTime;
	private String stopTime;
	private String htkvah;
	private String con;
	
	private String ry;
	private String yb;
	private String br;
	private String ampsY;
	private String ampsG;
	private String ampsR;
	private String ups1Y;
	private String ups1G;
	private String ups1R;
	private String ups2Y;
	private String ups2G;
	private String ups2R;
	private String upsoutY;
	private String upsoutG;
	private String upsoutR;
	private String verifiedBy;
	
	
   
	public String getVerifiedBy() {
		return verifiedBy;
	}

	public void setVerifiedBy(String verifiedBy) {
		this.verifiedBy = verifiedBy;
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

	public String getHtkvah() {
		return htkvah;
	}

	public void setHtkvah(String htkvah) {
		this.htkvah = htkvah;
	}

	public String getCon() {
		return con;
	}

	public void setCon(String con) {
		this.con = con;
	}

	public String getRy() {
		return ry;
	}

	public void setRy(String ry) {
		this.ry = ry;
	}

	public String getYb() {
		return yb;
	}

	public void setYb(String yb) {
		this.yb = yb;
	}

	public String getBr() {
		return br;
	}

	public void setBr(String br) {
		this.br = br;
	}

	public String getAmpsY() {
		return ampsY;
	}

	public void setAmpsY(String ampsY) {
		this.ampsY = ampsY;
	}

	public String getAmpsG() {
		return ampsG;
	}

	public void setAmpsG(String ampsG) {
		this.ampsG = ampsG;
	}

	public String getAmpsR() {
		return ampsR;
	}

	public void setAmpsR(String ampsR) {
		this.ampsR = ampsR;
	}

	public String getUps1Y() {
		return ups1Y;
	}

	public void setUps1Y(String ups1y) {
		ups1Y = ups1y;
	}

	public String getUps1G() {
		return ups1G;
	}

	public void setUps1G(String ups1g) {
		ups1G = ups1g;
	}

	public String getUps1R() {
		return ups1R;
	}

	public void setUps1R(String ups1r) {
		ups1R = ups1r;
	}

	public String getUps2Y() {
		return ups2Y;
	}

	public void setUps2Y(String ups2y) {
		ups2Y = ups2y;
	}

	public String getUps2G() {
		return ups2G;
	}

	public void setUps2G(String ups2g) {
		ups2G = ups2g;
	}

	public String getUps2R() {
		return ups2R;
	}

	public void setUps2R(String ups2r) {
		ups2R = ups2r;
	}

	public String getUpsoutY() {
		return upsoutY;
	}

	public void setUpsoutY(String upsoutY) {
		this.upsoutY = upsoutY;
	}

	public String getUpsoutG() {
		return upsoutG;
	}

	public void setUpsoutG(String upsoutG) {
		this.upsoutG = upsoutG;
	}

	public String getUpsoutR() {
		return upsoutR;
	}

	public void setUpsoutR(String upsoutR) {
		this.upsoutR = upsoutR;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
