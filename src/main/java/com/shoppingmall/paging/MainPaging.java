package com.shoppingmall.paging;


import com.shoppingmall.dao.ProductDAO;

//게시판의 페이징 처리를 위한 값을 저장 관리
public class MainPaging {

  private int currentPage; //현재페이지
  private int nowBlock = 1; //현재 블록(페이지 담는 단위)

  private int productPerPage = 6; //하나의 페이지에 표시할 상품의 수
  private int pagePerBlock = 5; //블록당 표시하는 페이지 갯수

  private int totalProduct;//총 상품의 수
  private int totalPage; //전체 페이지 갯수
  private int totalBlock = 0; //전체 블록 갯수

  private int begin; //현재 페이지상의 시작 번호
  private int end; //현재 페이지상의 마지막 번호

  private int beginPage; //현재 블록의 시작 페이지 번호
  private int endPage; //현재 블록의 끝 페이지 번호

  public MainPaging() {
    this(1);
    setTotalProduct();
    setTotalPage();
    setEnd();
    setBegin();
    if(getEnd() > getTotalProduct()) {
      end = getTotalProduct();
    }
    setBeginPage();
    setEndPage();
    if(getEndPage() > getTotalPage()) {
      endPage = getTotalPage();
    }
  }

  public MainPaging(int currentPage) {
    this.currentPage = currentPage;
    setTotalProduct();
    setTotalPage();
    setEnd();
    setBegin();
    if(getEnd() > getTotalProduct()) {
      end = getTotalProduct();
    }
    setBeginPage();
    setEndPage();
    if(getEndPage() > getTotalPage()) {
      endPage = getTotalPage();
    }
  }

  //전체 페이지 갯수 구하기
  //totalRecord 값을 페이지당 표시할 글의 개수 값을 나누고,
  //나머지가 있으면 페이지 하나 더 추가
  public void setTotalPage() {
    totalPage = totalProduct / productPerPage;
    if (totalProduct % productPerPage > 0) {
      totalPage++;
    }
  }


  public int getCurrentPage() {
    return currentPage;
  }

  public void setCurrentPage(int currentPage) {
    this.currentPage = currentPage;
  }

  public void setTotalProduct() {
    this.totalProduct = ProductDAO.getCountAll();
  }
  public int getNowBlock() {
    return nowBlock;
  }

  public void setNowBlock(int nowBlock) {
    this.nowBlock = nowBlock;
  }

  public int getProductPerPage() {
    return productPerPage;
  }

  public void setProductPerPage(int productPerPage) {
    this.productPerPage = productPerPage;
  }

  public int getPagePerBlock() {
    return pagePerBlock;
  }

  public void setPagePerBlock(int pagePerBlock) {
    this.pagePerBlock = pagePerBlock;
  }

  public int getTotalProduct() {
    return totalProduct;
  }


  public int getTotalPage() {
    return totalPage;
  }

  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }

  public int getTotalBlock() {
    return totalBlock;
  }

  public void setTotalBlock(int totalBlock) {
    this.totalBlock = totalBlock;
  }

  public int getBegin() {
    return begin;
  }

  public void setBegin() {
    this.begin = getEnd() - getProductPerPage() + 1;
  }

  public int getEnd() {
    return end;
  }

  public void setEnd() {
    this.end = getCurrentPage() * getProductPerPage();
  }

  public int getBeginPage() {
    return beginPage;
  }

  public void setBeginPage() {
    this.beginPage = (getCurrentPage() - 1) / getPagePerBlock() * getPagePerBlock() + 1;
  }

  public int getEndPage() {
    return endPage;
  }

  public void setEndPage() {
    this.endPage = getBeginPage() + getPagePerBlock() - 1;
  }


  @Override
  public String toString() {
    return "MainPaging{" +
        "currentPage=" + currentPage +
        ", nowBlock=" + nowBlock +
        ", productPerPage=" + productPerPage +
        ", pagePerBlock=" + pagePerBlock +
        ", totalProduct=" + totalProduct +
        ", totalPage=" + totalPage +
        ", totalBlock=" + totalBlock +
        ", begin=" + begin +
        ", end=" + end +
        ", beginPage=" + beginPage +
        ", endPage=" + endPage +
        '}';
  }
}
















