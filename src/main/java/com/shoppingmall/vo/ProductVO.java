package com.shoppingmall.vo;

import java.sql.Date;

public class ProductVO {

	int pIdx; //제품번호
	String pId; //판매자ID
	String category; //카테고리
	String product; //제품명
	int price; //제품가격
	String oriName; //제품이미지파일 이름
	String reName; //제품이미지파일 이름(리네임)
	String pIntroduce; //제품소개
	Date pDate; //제품등록날짜
	
	
	//cart용 추가========================================================
	// 수량, 수량별 금액 (판매가 * 수량)
		private int quant; //장바구니에 담긴 수량
		private int totalPrice; //수량별 금액(판매가 * 수량)
		
		public int getQuant() {
			return quant;
		}
		public void setQuant(int quant) {
			this.quant = quant;
			// 수량이 변경되면 수량별 금액(totalPrice) 계산 후 변경처리
			totalPrice = price * quant;
		}
		public int getTotalPrice() {
			return totalPrice;
		}
		public void setTotalPrice(int totalPrice) {
			this.totalPrice = totalPrice;
		}
		
	//==================================================================
	
	
	
	public int getpIdx() {
		return pIdx;
	}
	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
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
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getReName() {
		return reName;
	}
	public void setReName(String reName) {
		this.reName = reName;
	}
	public String getpIntroduce() {
		return pIntroduce;
	}
	public void setpIntroduce(String pIntroduce) {
		this.pIntroduce = pIntroduce;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	
	
	
	//내가 다시만듬
	@Override
	public String toString() {
		return "ProductVO [pIdx=" + pIdx + ", pId=" + pId + ", category=" + category + ", product=" + product
				+ ", price=" + price + ", oriName=" + oriName + ", reName=" + reName + ", pIntroduce=" + pIntroduce
				+ ", pDate=" + pDate + ", quant=" + quant + ", totalPrice=" + totalPrice + "]";
	}

	
	
}
