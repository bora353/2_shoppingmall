package com.shoppingmall.command;

import com.shoppingmall.dao.QnaDAO;
import com.shoppingmall.dao.RegisterDAO;
import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingmall.paging.Paging;
import com.shoppingmall.vo.QnaVO;
import com.shoppingmall.vo.UserVO;
import org.apache.catalina.User;


public class ServiceCommand implements Command {
	

		@Override
		public String exec(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
			
			HttpSession session =request.getSession();
			
			System.out.println("> ServiceCommand list 요청에 대한 처리 작업");

			String id = (String) request.getSession().getAttribute("id");

			Paging p = new Paging();
			//1. 전체 게시물 수량 구하기
			p.setTotalRecord(QnaDAO.getTotalCount());
			p.setTotalPage();
			
			System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
			System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
			
			//2. 현재 페이지 구하기
			String cPage = request.getParameter("cPage");
			if (cPage != null) {
				p.setNowPage(Integer.parseInt(cPage));
			}
			System.out.println("> cPage : " + cPage);
			System.out.println("> Paging nowPage : " + p.getNowPage());
			
			//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
			p.setEnd(p.getNowPage() * p.getNumPerPage());
			p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
			
			//3-1. (선택적) 끝번호가 데이터 건수보다 크면 데이터 건수와 동일하게 처리
			if (p.getEnd() > p.getTotalRecord()) {
				p.setEnd(p.getTotalRecord());
			}
			System.out.println(">> 시작번호(begin) : " + p.getBegin());
			System.out.println(">> 끝번호(end) : " + p.getEnd());
			
			//------- 블록(Block) 계산하기 ---------
			//4. 블록 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
			//4-1. 시작페이지, 끝페이지 구하기
			int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
			p.setBeginPage(beginPage);
			p.setEndPage(beginPage + p.getPagePerBlock() - 1);
			
			//4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
			// 끝페이지를 전체페이지 수로 변경 처리
			if (p.getEndPage() > p.getTotalPage()) {
				p.setEndPage(p.getTotalPage());
			}
			
			System.out.println(">> beginPage : " + p.getBeginPage());
			System.out.println(">> endPage : " + p.getEndPage());
			
			
			//1. DB연결하고 데이터 가져오기
			List<QnaVO> list = QnaDAO.getList(p.getBegin(), p.getEnd());
			System.out.println(">> 현재페이지 글목록(list) : " + list);
			
			
			UserVO user = RegisterDAO.selectUserById(id);
			
			
			//2. 응답페이지(list.jsp)에 전달(request 객체에 저장해서 전달)
			request.setAttribute("list", list);
			session.setAttribute("userList", user);
			
			// 로그인되어 있을시 로그인 List 불러오기
			session.getAttribute("userList");
			
			//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩
			//request.getRequestDispatcher("list.jsp").forward(request, response);
			
			return "service.jsp"; //응답할 페이지
		}

}
