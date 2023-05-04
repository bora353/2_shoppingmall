package com.shoppingmall.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.shoppingmall.mybatis.DBService;
import com.shoppingmall.vo.CartVO;
import com.shoppingmall.vo.ReviewVO;

public class CartDAO {
	
	// 카트 전체리스트
	public static List<CartVO> getCartAll(int userIdx) {
		/*
		 * Map<String, Integer> map = new HashMap<>(); map.put("userIdx", userIdx);
		 * map.put("pIdx", pIdx);
		 */
		
		SqlSession ss = DBService.getFactory().openSession();
		List<CartVO> cart_list = ss.selectList("shopping.cart_selectAll", userIdx);
		ss.close();
		
		return cart_list;
	}
	
	// 카트삭제
	public static int cartDelete(int cartIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("shopping.deleteCart", cartIdx);
		ss.close();
		
		return result;
	}
	
	// 카트 수량 (+) 업데이트
	public static int updatePlusCart(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shopping.updatePlusCart", map);
		ss.close();

		return result;
	}
	// 카트 수량 (-) 업데이트
	public static int updateMinusCart(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shopping.updateMinusCart", map);
		ss.close();
		
		return result;
	}
	
	// 카트 1개 가져오기
	public static CartVO getCartOne(int cartIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		CartVO cart_one = ss.selectOne("shopping.cart_selectOne", cartIdx);
		ss.close();
		
		return cart_one;
	}
	
	// 카트 전체 개수(사람에 따른) 
	public static int cartCount(int userIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("shopping.cartCount", userIdx);
		ss.close();
		
		return result;
	}
	
	// 장바구니 담기
	public static int insertCart(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("shopping.insertCart", map);
		ss.close();

		return result;
	}
	
	
	
	
}
