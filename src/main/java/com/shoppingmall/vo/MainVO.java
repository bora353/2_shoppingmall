package com.shoppingmall.vo;

/* 
메인페이지에서 출력해야 할 것
 * 리스트번호
 * 유저번호
 * 유저이름
 * 상품번호
 * 카테고리
 * 제품명
 * 가격
 * 상품이미지
 */
public class MainVO {
	private int listIdx;
	private int userIdx;
	private String userId;
	private int pIdx;
	private String category;
	private String product;
	private int price;
	private String reName;
	
	public int getListIdx() {
		return listIdx;
	}
	public void setListIdx(int listIdx) {
		this.listIdx = listIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getpIdx() {
		return pIdx;
	}
	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getReName() {
		return reName;
	}
	public void setReName(String reName) {
		this.reName = reName;
	}
	
	@Override
	public String toString() {
		return "MainVO [listIdx=" + listIdx + ", userIdx=" + userIdx + ", userId=" + userId + ", pIdx=" + pIdx
				+ ", category=" + category + ", product=" + product + ", price=" + price + ", reName=" + reName + "]";
	}
	
}
