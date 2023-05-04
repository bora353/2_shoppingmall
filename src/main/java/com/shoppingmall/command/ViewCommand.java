package com.shoppingmall.command;

import com.shoppingmall.dao.ReviewDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingmall.vo.ReviewVO;

public class ViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//상세뷰 화면구현
		int reviewIdx = Integer.parseInt((String) req.getParameter("reviewIdx"));
		ReviewVO vo = ReviewDAO.selectOne(reviewIdx);
//		req.setAttribute("vo", vo);
		req.getSession().setAttribute("vo_s", vo);
		
		
//=====================================================================================
		//쿠키로 조회수 증가처리
		
	   Cookie viewCookie=null; // 1.쿠키값을 정희해준다.
       Cookie[] cookies=req.getCookies(); // 2. 클라이언트가 보낸 데이터에서 쿠기값을 가져온다.

       System.out.println("cookie : "+cookies); // 3.쿠키이름 확인하기 위해서 출력한다.
       
       
       if(cookies !=null) {  // 4. 쿠키의 값이 있을경우에

           for (int i = 0; i < cookies.length; i++) {  // 5.쿠기가 돌아가는동안에
               
               //만들어진 쿠키들을 확인하며, 만약 들어온 적 있다면 생성되었을 쿠키가 있는지 확인
               if(cookies[i].getName().equals("visit_cookie_"+vo.getReviewIdx())) {
                   System.out.println("if문 쿠키 이름 : "+cookies[i].getName());  // 6.내가 밑에서 만들어놓은 쿠키가 있는지 확인좀..
               
               //찾은 쿠키를 변수에 저장
                   viewCookie=cookies[i]; // 7. 쿠키값을 찾으면 viewCookie 에다가 저장을 해봅시다.
                   System.out.println("viewCookie ="+viewCookie); // 8. 위치확인
               }
           }
           
       }else {  // 9.쿠키가 없으면 실행
           System.out.println("cookies 확인 로직 : 쿠키가 없습니다.");
       }


       //만들어진 쿠키가 없음을 확인
       if(viewCookie==null) {  // 10. 쿠키가 없을때 실행대는 로직이고 쿠기가 있으면 실행이 안되고 위에서 멈춘다.
       
             System.out.println("viewCookie 확인 로직 : 쿠키 없당"); // 11. 쿠키가 없다는걸 알려줘야함.,
           
           try {                                                // 12. 예외출력을 이용해서 씀 try catch 
           
               //이 페이지에 왔다는 증거용(?) 쿠키 생성
               Cookie newCookie=new Cookie("visit_cookie_"+vo.getReviewIdx(),"OK"); // 13.새로운 쿠기를 생성해서 (key,value) 값을 넣어줌 
               newCookie.setMaxAge(60*60*24);		// 쿠키 시간 하루로 설정
               resp.addCookie(newCookie);                      // 14. 13번에서 쿠기 값을 넣어준거를 다시 클라이언트에다가 보내줌 
               
               //쿠키가 없으니 증가 로직 진행
             //조회수 증가
	       		int result = ReviewDAO.updateHit(reviewIdx);  			// 15. 쿠키 클라이언트에 보내주고 조회수 증가 로직을 실행시켜줌
	       		System.out.println("조회수 증가처리 결과 : "+result);			// 16. 게시물번호에 대한 조회수 카운트
               
           } catch (Exception e) {
               System.out.println("쿠키 넣을때 오류 나나? : "+e.getMessage());  // 17. 입력오류 나올때는 입력 오류인지 확인하는 에외부분
               e.getStackTrace();

           }
       
       //만들어진 쿠키가 있으면 증가로직 진행하지 않음
       }else {                                                // 18. 만들어진 쿠기가 있으면 
           System.out.println("viewCookie 확인  : 쿠키 있당");  
           String value=viewCookie.getValue();                  // 19.쿠키의 값을 반환  13번 "Engilsh" 부분을반환
           System.out.println("viewCookie 확인 : 쿠키 value : "+value); // 20. 콘솔로 알아보기 쉽게 출력
       }
          
//=====================================================================================
     //계속생성되는것이 문제!!
       
       //insert 먼저!
	  int insertresult = ReviewDAO.insertLike(reviewIdx);
	  System.out.println("insert result : " + insertresult);
       
		
	// 좋아요 count 가져오기
      int likeCount = ReviewDAO.getlikeCount(reviewIdx);
      req.getSession().setAttribute("likeCount", likeCount);

		

		return "/review/view.jsp";
	}

}
