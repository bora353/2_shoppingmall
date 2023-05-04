package com.shoppingmall.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.dao.ProductDAO;
import com.shoppingmall.paging.ProductPaging;
import com.shoppingmall.vo.ProductVO;
import com.shoppingmall.vo.UserVO;

public class ProductListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		try {
			String id = (String)session.getAttribute("id");
			System.out.println("id = " + id);
			UserVO uvo = (UserVO)session.getAttribute("user");
			System.out.println("uvo : " + uvo);
//			String id = uvo.getUserId();
			System.out.println("id : " + id);

			ProductPaging pg = new ProductPaging();
			pg.setTotalProduct(ProductDAO.getCountProduct(id)); //판매자 제품전체 갯수
			pg.setTotalPage(); //전체페이지 갯수
			
			String nowPage = request.getParameter("nowPage"); //현재페이지
			if (nowPage != null) {
				pg.setNowPage(Integer.parseInt(nowPage));
			}
			
			pg.setEnd(pg.getNowPage() * pg.getPageProductNum()); //제품 끝번호
			pg.setBegin(pg.getEnd() - pg.getPageProductNum() + 1); //제품 시작번호
			
			//끝번호가 데이터 건수보다 크면 데이터 건수와 동일하게 처리
			if (pg.getEnd() > pg.getTotalProduct()) {
				pg.setEnd(pg.getTotalProduct());
			}
			
			int beginPage = (pg.getNowPage() - 1) / pg.getBlockPageNum() * pg.getBlockPageNum() + 1;
			pg.setBeginPage(beginPage);
			pg.setEndPage(beginPage + pg.getBlockPageNum() - 1);
			
			//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
			// 끝페이지를 전체페이지 수로 변경 처리
			if (pg.getEndPage() > pg.getTotalPage()) {
				pg.setEndPage(pg.getTotalPage());
			}
			
			//현재 블록
			pg.setNowBlock((pg.getEndPage() / pg.getBlockPageNum()));
			pg.setpId(id); //판매자 아이디
			
			List<ProductVO> list = ProductDAO.getPageProductList(pg); //입력번호 제품 리스트
			request.setAttribute("list", list); //입력번호 제품 리스트 저장
			request.setAttribute("pvo", pg); //페이지 데이터
			System.out.println("pg = " + pg);
			session.setAttribute("nPage", pg.getNowPage());
		} catch (NullPointerException e) {}
		
		return "productList.jsp";
	}

}
