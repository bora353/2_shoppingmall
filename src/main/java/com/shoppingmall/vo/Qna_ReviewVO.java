package com.shoppingmall.vo;

import java.sql.Date;

public class Qna_ReviewVO {
	int rNo;
    int qNo;
    int userNo;
    int rPwd;
    String rWriter;
    Date rDate;
    String rContent;

    
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getrWriter() {
		return rWriter;
	}
	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}
	public int getrPwd() {
		return rPwd;
	}
	public void setrPwd(int rPwd) {
		this.rPwd = rPwd;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	@Override
	public String toString() {
		return "Qna_ReviewVO [rNo=" + rNo + ", qNo=" + qNo + ", userNo=" + userNo + ", rPwd=" + rPwd + ", rWriter="
				+ rWriter + ", rDate=" + rDate + ", rContent=" + rContent + "]";
	}
	
	
    
	
    
}
