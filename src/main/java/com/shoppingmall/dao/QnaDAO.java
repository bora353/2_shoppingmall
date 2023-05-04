package com.shoppingmall.dao;

import com.shoppingmall.mybatis.DBService;
import com.shoppingmall.vo.QnaVO;
import com.shoppingmall.vo.Qna_ReviewVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;


public class QnaDAO {
	
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("shopping.serviceTotalCount");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기
		public static List<QnaVO> getList(Map<String, Integer> map) {
			SqlSession ss = DBService.getFactory().openSession();
			List<QnaVO> list = ss.selectList("shopping.list", map);
			ss.close();
			return list;
		}
		
		public static List<QnaVO> getList(int begin, int end) {
			Map<String, Integer> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			
			SqlSession ss = DBService.getFactory().openSession();
			List<QnaVO> list = ss.selectList("shopping.list", map);
			ss.close();
			return list;
		}
		
		//게시글 1개 조회
		public static QnaVO selectOne(int qNum) {
			SqlSession ss = DBService.getFactory().openSession();
			QnaVO vo = ss.selectOne("shopping.one", qNum);
			ss.close();
			return vo;
		}
		
		//게시글 입력처리
		public static int insert(QnaVO qvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("shopping.insert", qvo);
			ss.close();
			return result;
		}
		
		//게시글 삭제처리
		public static int delete(int qNo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("shopping.delete", qNo);
			ss.close();
			return result;
		}
		
		//게시글 수정처리
		public static int update(QnaVO qvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("shopping.update", qvo);
			ss.close();
			return result;
		}
		
		//게시글 조회수 카운트
		public static int updateHit(int qNo){
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("shopping.hit", qNo);
			ss.close();
			
			return result;
		}
		
		//======== 댓글 관련 기능 ==============
		public static List<Qna_ReviewVO> getCommList(int qNo) {
			SqlSession ss = DBService.getFactory().openSession();
			List<Qna_ReviewVO> list = ss.selectList("shopping.commList", qNo);
			ss.close();
			return list;
		}
		
		//댓글 1개 조회
		public static Qna_ReviewVO getCommentOne(int rNo) {
			SqlSession ss = DBService.getFactory().openSession();
			Qna_ReviewVO vo = ss.selectOne("shopping.commOne", rNo);
			ss.close();
			return vo;
		}
		
		//댓글 입력처리 insertComment()
		public static int insertComment(Qna_ReviewVO rvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("shopping.commInsert", rvo);
			ss.close();
			return result;
		}
		
		//댓글 삭제
		public static int deleteComment(int rNo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("shopping.commDelete", rNo);
			ss.close();
			return result;
		}
		
}
