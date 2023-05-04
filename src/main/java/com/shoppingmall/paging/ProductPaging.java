package com.shoppingmall.paging;

public class ProductPaging {
	private int nowPage = 1; //현재페이지
	private int nowBlock = 1; //현재 블록(페이지 담는 단위)
	
	private int pageProductNum = 3; //하나의 페이지에 표시할 제품갯수
	private int blockPageNum = 3; //블록당 표시하는 페이지 갯수
	
	private int totalProduct = 0; //총 제품 갯수(원본 게시글 수)
	private int totalPage = 0; //전체 페이지 갯수
	private int totalBlock = 0; //전체 블록 갯수
	
	private int begin = 0; //현재 페이지 제품 시작 번호
	private int end = 0; //현재 페이지 제품 마지막 번호
	
	private int beginPage = 0; //현재 블록의 시작 페이지 번호
	private int endPage = 0; //현재 블록의 끝 페이지 번호
	
	private String pId; //판매자id
	
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getPageProductNum() {
		return pageProductNum;
	}
	public void setPageProductNum(int pageProductNum) {
		this.pageProductNum = pageProductNum;
	}
	public int getBlockPageNum() {
		return blockPageNum;
	}
	public void setBlockPageNum(int blockPageNum) {
		this.blockPageNum = blockPageNum;
	}
	public int getTotalProduct() {
		return totalProduct;
	}
	public void setTotalProduct(int totalProduct) {
		this.totalProduct = totalProduct;
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
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	@Override
	public String toString() {
		return "ProductPaging [nowPage=" + nowPage + ", nowBlock=" + nowBlock + ", pageProductNum=" + pageProductNum
				+ ", blockPageNum=" + blockPageNum + ", totalProduct=" + totalProduct + ", totalPage=" + totalPage
				+ ", totalBlock=" + totalBlock + ", begin=" + begin + ", end=" + end + ", beginPage=" + beginPage
				+ ", endPage=" + endPage + "]";
	}
	
	public void setPage() {
		
	}
	
	public void setTotalPage() {
		totalPage = totalProduct / pageProductNum;
		if(totalProduct % pageProductNum > 0) totalPage++;
	}
	public void setTotalPageTotalProduct(int totalProduct) {
		totalPage = totalProduct / pageProductNum;
		if(totalProduct % pageProductNum > 0) totalPage++;
	}
	public void setEnd() {
		end = nowPage * pageProductNum;
		if (end > totalProduct) {
			setEnd(totalProduct);
		}
	}
	public void setBegin() {
		begin = end - pageProductNum + 1;
	}
	
}
