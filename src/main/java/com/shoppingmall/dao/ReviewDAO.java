package com.shoppingmall.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.shoppingmall.mybatis.DBService;
import com.shoppingmall.vo.ReviewVO;

public class ReviewDAO {

	// 페이징 처리 전체보기
	public static List<ReviewVO> getReviewList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("shopping.review_all", map);
		ss.close();

		return list;
	}

	// 페이징 처리 전체보기
	public static List<ReviewVO> getReviewList(int begin, int end, int order, int pIdx) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		System.out.println("order 확인!! :" + order);
		map.put("order", order);
		map.put("pIdx", pIdx);

		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("shopping.review_all", map);
		ss.close();

		return list;
	}

	// 총 상품평 개수
	public static int getReviewCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("shopping.review_count");
		ss.close();

		return result;
	}

	// 상세보기
	public static ReviewVO selectOne(int reviewIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		ReviewVO vo = ss.selectOne("shopping.review_selectOne", reviewIdx);
		ss.close();

		return vo;
	}

	// 리뷰 작성
	public static int insertReview(ReviewVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("shopping.insertReview", vo);
		ss.close();

		return result;
	}

	// 리뷰 삭제
	public static int deleteReview(int reviewIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("shopping.deleteReview", reviewIdx);
		ss.close();

		return result;
	}

	// 리뷰 업데이트
	public static int updateReview(ReviewVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shopping.updateReview", vo);
		ss.close();

		return result;
	}

	public static int updateHit(int reviewIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shopping.review_hit", reviewIdx);
		ss.close();

		return result;
	}

	// like 클릭 시 증가
	public static int updateLike(String no, String id) {
		Map<String, String> map = new HashMap<>();
		map.put("no", no);
		map.put("id", id);

		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shopping.like_check", map);
		ss.close();

		return result;
	}

	// like 개수
	public static int getlikeCount(int no) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("shopping.like_check_count", no);
		ss.close();

		return result;
	}

	// like 클릭 시 0
	public static int updateLikeCancer(int reviewIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("shopping.like_check_cancel", reviewIdx);
		ss.close();

		return result;
	}
	

	// like insert 작성
	public static int insertLike(int reviewIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("shopping.likeInsert", reviewIdx);
		ss.close();

		return result;
	}
	
	
	
}
