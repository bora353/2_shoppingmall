package com.shoppingmall.dao;

import com.shoppingmall.mybatis.DBService;
import com.shoppingmall.vo.UserVO;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class RegisterDAO {

	public static List<UserVO> selectAll() {
		SqlSessionFactory factory = DBService.getFactory();
		SqlSession ss = factory.openSession();
		List<UserVO> list = ss.selectList("shopping.findAllUser");
		ss.close();

		return list;
	}

	public static boolean checkDuplicate(String checkId) {

		String duplicateId = selectAll().stream().map((user) -> user.getUserId()).filter((s) -> s.equals(checkId))
				.findAny().orElse("");

		return duplicateId.equals("") ? false : true;
	}

	public static int insertOne(UserVO userVO) {
		SqlSessionFactory factory = DBService.getFactory();
		SqlSession ss = factory.openSession(true);
		int result = ss.insert("shopping.insertUser", userVO);
		ss.close();
		return result;
	}

	public static UserVO selectUserById(String userId) {
		SqlSessionFactory factory = DBService.getFactory();
		SqlSession ss = factory.openSession();
		UserVO userVO = ss.selectOne("shopping.findUserById", userId);
		ss.close();
		return userVO;
	}

	public static int updateDelete(int userIdx) {
		SqlSession ss = null;
		int result = 0;
		try {
			SqlSessionFactory factory = DBService.getFactory();
			ss = factory.openSession();
			result = ss.update("shopping.updateUserStatus", userIdx);
			ss.commit();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			ss.rollback();
		} finally {
			ss.close();
		}
		return result;
	}

	public static int updateCellphone(Map map) {
		SqlSession ss = null;
		int result = 0;
		try {
			SqlSessionFactory factory = DBService.getFactory();
			ss = factory.openSession();
			result = ss.update("shopping.updateCellphone", map);
			ss.commit();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			ss.rollback();
			return 0;
		} finally {
			ss.close();
		}
	}

  public static int updateIntroduction(Map map) {
		SqlSession ss = null;
		int result = 0;
		try {
			SqlSessionFactory factory = DBService.getFactory();
			ss = factory.openSession();
			result = ss.update("shopping.updateIntroduction", map);
			ss.commit();
			return result;
		} catch (Exception e) {
			ss.rollback();
			return 0;
		} finally {
			ss.close();
		}
  }

  public static int updateName(Map map) {
		SqlSession ss = null;
		int result = 0;
		try {
			SqlSessionFactory factory = DBService.getFactory();
			ss = factory.openSession();
			result = ss.update("shopping.updateName", map);
			ss.commit();
			return result;
		} catch (Exception e) {
			ss.rollback();
			return 0;
		} finally {
			ss.close();
		}
	}
	public static int updateEmail(Map map) {
		SqlSession ss = null;
		int result = 0;
		try {
			SqlSessionFactory factory = DBService.getFactory();
			ss = factory.openSession();
			result = ss.update("shopping.updateEmail", map);
			ss.commit();
			return result;
		} catch (Exception e) {
			ss.rollback();
			return 0;
		} finally {
			ss.close();
		}
	}

	public static int updatePassword(Map map) {
		SqlSession ss = null;
		int result = 0;
		try {
			SqlSessionFactory factory = DBService.getFactory();
			ss = factory.openSession();
			result = ss.update("shopping.updateUserPassword", map);
			ss.commit();
			return result;
		} catch (Exception e) {
			ss.rollback();
			return 0;
		} finally {
			ss.close();
		}
	}

  public static int address(Map map) {

		SqlSession ss = null;
		int result = 0;
		try {
			SqlSessionFactory factory = DBService.getFactory();
			ss = factory.openSession();
			result = ss.update("shopping.updateAddress", map);
			ss.commit();
			return result;
		} catch (Exception e) {
			ss.rollback();
			return 0;
		} finally {
			ss.close();
		}
  }
}

