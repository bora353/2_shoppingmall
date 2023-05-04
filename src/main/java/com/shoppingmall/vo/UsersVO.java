package com.shoppingmall.vo;


import java.util.Date;

public class UsersVO {

  private int userIdx;
  private String userId;
  private String password;
  private String userName;
  private String cellPhone;
  private String eMail;
  private String introduction;
  private Date joinDate;
  private String loginType;
  private String userType;

  public UsersVO(int userIdx, String userId, String password, String userName, String introduction,
      String cellPhone) {
    this.userIdx = userIdx;
    this.userId = userId;
    this.password = password;
    this.userName = userName;
    this.introduction = introduction;
    this.cellPhone = cellPhone;
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


  public String getLoginType() {
    return loginType;
  }

  public void setLoginType(String loginType) {
    this.loginType = loginType;
  }


  public String getUserType() {
    return userType;
  }

  public void setUserType(String userType) {
    this.userType = userType;
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

  public String getIntroduction() {
    return introduction;
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

  public String getCellPhone() {
    return cellPhone;
  }

  public void setCellPhone(String cellPhone) {
    this.cellPhone = cellPhone;
  }

  @Override
  public String toString() {
    return "UserVO{" +
        "userIdx=" + userIdx +
        ", userId='" + userId + '\'' +
        ", password='" + password + '\'' +
        ", userName='" + userName + '\'' +
        ", introduction='" + introduction + '\'' +
        ", cellPhone='" + cellPhone + '\'' +
        ", joinDate=" + joinDate +
        ", loginType='" + loginType + '\'' +
        ", userType='" + userType + '\'' +
        '}';
  }
}
