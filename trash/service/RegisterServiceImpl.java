//package com.shoppingmall.service;
//
//
//import com.shoppingmall.vo.UserVO;
//
//import java.util.List;
//import java.util.Map;
//
//public class RegisterServiceImpl implements RegisterService {
//
//  private RegisterDAO registerDAO;
//
//  public RegisterServiceImpl() {
//    registerDAO = new RegisterDAOImpl();
//  }
//
//
//  @Override
//  public boolean checkDuplicate(String checkId) {
//
//    System.out.println("checkId = " + checkId);
//    String duplicateId = null;
//    try {
//      duplicateId = registerDAO.selectAll().stream().map((user) -> user.getUserId())
//          .filter((s) -> s.equals(checkId)).findAny().orElse(null);
//    } catch (NullPointerException e) {
//      duplicateId = null;
//    }
//
//    return duplicateId == null ? false : true;
//  }
//
//  @Override
//  public List<UserVO> getUserList() {
//    try {
//      return registerDAO.selectAll();
//    } catch (Exception e) {
//      e.printStackTrace();
//    }
//    return null;
//  }
//
//  @Override
//  public UserVO getUserById(String userId) {
//    return registerDAO.selectUserById(userId);
//  }
//
//  @Override
//  public int join(UserVO userVO) {
//    try {
//      return registerDAO.insertOne(userVO);
//    } catch (Exception e) {
//      e.printStackTrace();
//    }
//    return 0;
//  }
//
//  @Override
//  public int withDrawl(int userIdx) {
//      return registerDAO.updateDelete(userIdx);
//
//    }
//
//  @Override
//  public int changeName(Map map) {
//    return registerDAO.updateName(map);
//  }
//
//  @Override
//  public int changeCellphone(Map map) {
//    return registerDAO.updateCellphone(map);
//  }
//
//  @Override
//  public UserVO getUserByIdx(int userIdx) {
//    return  registerDAO.selectUserByIdx(userIdx);
//  }
//}
