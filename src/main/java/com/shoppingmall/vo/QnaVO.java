package com.shoppingmall.vo;

import java.sql.Date;

public class QnaVO {
	int qNo; 
    int userNo;
    String qTitle;
    int qPwd;
    String qWriter;
    String qContent;
    Date qDate;
    int qHit;
    String qCategory;
    String qFilename;
    String qOriname;
    
    
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
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public int getqPwd() {
		return qPwd;
	}
	public void setqPwd(int qPwd) {
		this.qPwd = qPwd;
	}
	public String getqWriter() {
		return qWriter;
	}
	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public int getqHit() {
		return qHit;
	}
	public void setqHit(int qHit) {
		this.qHit = qHit;
	}
	public String getqCategory() {
		return qCategory;
	}
	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}
	public String getqFilename() {
		return qFilename;
	}
	public void setqFilename(String qFilename) {
		this.qFilename = qFilename;
	}
	public String getqOriname() {
		return qOriname;
	}
	public void setqOriname(String qOriname) {
		this.qOriname = qOriname;
	}
	@Override
	public String toString() {
		return "QnaVO [qNo=" + qNo + ", userNo=" + userNo + ", qTitle=" + qTitle + ", qPwd=" + qPwd + ", qWriter="
				+ qWriter + ", qContent=" + qContent + ", qDate=" + qDate + ", qHit=" + qHit + ", qCategory="
				+ qCategory + ", qFilename=" + qFilename + ", qOriname=" + qOriname + "]";
	}
    
	
    
}
