package com.shoppingmall.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.shoppingmall.mybatis.DBService;
import com.shoppingmall.paging.ProductPaging;
import com.shoppingmall.vo.ProductVO;

public class ProductDAO {
	
	//제품 전체리스트
	public static List<ProductVO> getProductAll() {
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("shopping.productAll");
		ss.close();
		return list;
	}
	//판매자별 제품리스트
	public static List<ProductVO> getProductOne(String pId) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("shopping.pIdSel", pId);
		ss.close();
		return list;
	}
	
	//입력번호 제품 리스트(전체)
	public static List<ProductVO> getPageList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss  = DBService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("shopping.pageList", map);
		ss.close();
		return list;
	}
	//입력번호 제품 리스트(판매자)
	public static List<ProductVO> getPageProductList(ProductPaging pg) {
		SqlSession ss  = DBService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("shopping.pageProductList", pg);
		ss.close();
		return list;
	}

	
	//제품 전체갯수
	public static int getCountAll() {
		SqlSession ss = DBService.getFactory().openSession();
		int count = ss.selectOne("shopping.totalCount");
		ss.close();
		return count;
	}
	//판매자별 제품갯수
	public static int getCountProduct(String pId) {
		SqlSession ss = DBService.getFactory().openSession();
		int count = ss.selectOne("shopping.pIdCount", pId);
		ss.close();
		return count;
	}
	
	//선택 제품정보
	public static ProductVO getProductOne(int pIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		ProductVO vo = ss.selectOne("shopping.productOne", pIdx);
		ss.close();
		return vo;
	}
	
	//제품등록
	public static int setProduct(ProductVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("shopping.productAdd", vo);
		ss.close();
		return result;
	}
	
	//제품수정
	public static int setUpdate(ProductVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shopping.productUp", vo);
		ss.close();
		return result;
	}
	
	//제품삭제
	public static int setDelete(int pIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("shopping.productDel", pIdx);
		ss.close();
		return result;
	}
}
