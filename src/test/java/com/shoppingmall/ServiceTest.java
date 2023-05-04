package com.shoppingmall;

import com.shoppingmall.dao.ProductDAO;
import com.shoppingmall.dao.RegisterDAO;
import com.shoppingmall.paging.MainPaging;
import com.shoppingmall.vo.ProductVO;
import com.shoppingmall.vo.UserVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@Transactional
public class ServiceTest {

  @BeforeEach
  public void beforeEach() {
  }

  @Test
  public void 문자열붙이기테스트() {
    String[] address = {"05222", "경기도 포천시 영북로 163-1", "광고집 3층"};
    String result = String.join("/", address);
    Assertions.assertThat(result).isEqualTo("05222/경기도 포천시 영북로 163-1/광고집 3층");

    String[] splitAddress = result.split("/");
    Assertions.assertThat(splitAddress).isEqualTo(address);
  }

  @Test
  public void 전화번호바꾸기() {
    Map map = new HashMap();
    map.put("newCellphone", "010-6774-4387");
    map.put("userIdx", 3);

    int result = RegisterDAO.updateCellphone(map);

    Assertions.assertThat(result).isEqualTo(1);

    UserVO userVO = RegisterDAO.selectUserById("1");
    System.out.println("userVO = " + userVO);
  }

  @Test
  public void 시작번호() {
    MainPaging p = new MainPaging();

    assertThat(p.getBegin()).isEqualTo(1);
    assertThat(p.getEnd()).isEqualTo(6);
  }

  @Test
  public void 시작페이지끝페이지() {
    MainPaging p = new MainPaging(1);

    System.out.println("p.getEndPage() = " + p.getEndPage());
    System.out.println("p.getBeginPage() = " + p.getBeginPage());
  }

  @Test
  public void 페이지에따른게시글번호() {
    MainPaging p = new MainPaging(5);

    List<ProductVO> pageList = ProductDAO.getPageList(p.getBegin(), p.getEnd());

    System.out.println("pageList = " + pageList);

    pageList.forEach(System.out::println);

  }
}
