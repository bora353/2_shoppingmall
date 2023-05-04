package com.shoppingmall.command;

import com.shoppingmall.dao.ReviewDAO;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.paging.Paging;
import com.shoppingmall.vo.ReviewVO;

public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 0.
		Paging p = new Paging();
		// 1. 전체 게시물 수량 구하기
		p.setTotalRecord(ReviewDAO.getReviewCount());
		p.setTotalPage();

		System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());

		// 2. 현재 페이지 구하기
		String cPage = req.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("> cPage : " + cPage);
		System.out.println("> Paging nowPage : " + p.getNowPage());

		// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		// 3-1. (선택적) 끝번호가 데이터 건수보다 크면 데이터 건수와 동일하게 처리
		/*
		 * if (p.getEnd() > p.getTotalRecord()) { p.setEnd(p.getTotalRecord()); }
		 */
		System.out.println(">> 시작번호(begin) : " + p.getBegin());
		System.out.println(">> 끝번호(end) : " + p.getEnd());

		// ------- 블록(Block) 계산하기 ---------
		// 4. 블록 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
		// 4-1. 시작페이지, 끝페이지 구하기
		int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getPagePerBlock() - 1);

		// 4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}

		System.out.println(">> beginPage : " + p.getBeginPage());
		System.out.println(">> endPage : " + p.getEndPage());

		req.getSession().setAttribute("pvo", p); // 페이지 관련 데이터
		System.out.println(p);

		int order = Integer.parseInt(req.getParameter("order"));
		System.out.println("order확인!!!!!!" + order);
		req.getSession().setAttribute("order", order);
		
		
		try {
			//에러나서
			//List<ReviewVO> list = ReviewDAO.getReviewList(p.getBegin(), p.getEnd(), order);
			//req.setAttribute("list", list);
			// System.out.println(list);
			
			// 조회수
			int count = ReviewDAO.getReviewCount();
			req.setAttribute("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/product/productViewMain.jsp";
	}

}
