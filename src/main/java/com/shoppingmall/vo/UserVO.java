package com.shoppingmall.vo;


import java.util.Date;

public class UserVO {
  private int userIdx;
  private String userId;
  private String password;
  private String userName;
  private String cellPhone;
  private String address;
  private String eMail;
  private String introduction;
  private Date joinDate;
  private int gender;
  private int loginType;
  private int userType;

  public UserVO() {

  }
  public UserVO(String userId, String password, String userName, String cellPhone,
      String address, String eMail, String introduction, int gender, int loginType,
      int userType) {
    this.userId = userId;
    this.password = password;
    this.userName = userName;
    this.cellPhone = cellPhone;
    this.address = address;
    this.eMail = eMail;
    this.introduction = introduction;
    this.gender = gender;
    this.loginType = loginType;
    this.userType = userType;
  }

  public int getUserIdx() {
    return userIdx;
  }

  public void setUserIdx(int userIdx) {
    this.userIdx = userIdx;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getCellPhone() {
    return cellPhone;
  }

  public void setCellPhone(String cellPhone) {
    this.cellPhone = cellPhone;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getEmail() {
    return eMail;
  }

  public void setEmail(String eMail) {
    this.eMail = eMail;
  }

  public String getIntroduction() {
    if(introduction != null) {
      return introduction;
    }
    return "";
  }

  public void setIntroduction(String introduction) {
    this.introduction = introduction;
  }

  public Date getJoinDate() {
    return joinDate;
  }

  public void setJoinDate(Date joinDate) {
    this.joinDate = joinDate;
  }

  public int getGender() {
    return gender;
  }

  public void setGender(int gender) {
    this.gender = gender;
  }

  public int getLoginType() {
    return loginType;
  }

  public void setLoginType(int loginType) {
    this.loginType = loginType;
  }

  public int getUserType() {
    return userType;
  }

  public void setUserType(int userType) {
    this.userType = userType;
  }

  @Override
  public String toString() {
    return "UserVO{" +
        "userIdx=" + userIdx +
        ", userId='" + userId + '\'' +
        ", password='" + password + '\'' +
        ", userName='" + userName + '\'' +
        ", cellPhone='" + cellPhone + '\'' +
        ", address='" + address + '\'' +
        ", Email='" + eMail + '\'' +
        ", introduction='" + introduction + '\'' +
        ", joinDate=" + joinDate +
        ", gender=" + gender +
        ", loginType='" + loginType + '\'' +
        ", userType='" + userType + '\'' +
        '}';
  }
}
