package com.shoppingmall.vo;

public class CartVO extends ProductVO {

	private int cartIdx;
	private int userIdx;
	private int pIdx;
	private int quant;


//cart용 추가========================================================
		// 수량, 수량별 금액 (판매가 * 수량)
			private int totalPrice; //수량별 금액(판매가 * 수량)
			public int getQuant() {
				return quant;
			}
			public void setQuant(int quant) {
				this.quant = quant;
				// 수량이 변경되면 수량별 금액(totalPrice) 계산 후 변경처리
				//totalPrice = price * quant;
			}
			public int getTotalPrice() {
				totalPrice = price * quant;
				return totalPrice;
			}
			public void setTotalPrice(int totalPrice) {
				this.totalPrice = totalPrice;
			}
			
//==========================================================================
			
			public int getCartIdx() {
				return cartIdx;
			}
			public void setCartIdx(int cartIdx) {
				this.cartIdx = cartIdx;
			}
			public int getUserIdx() {
				return userIdx;
			}
			public void setUserIdx(int userIdx) {
				this.userIdx = userIdx;
			}
			public int getpIdx() {
				return pIdx;
			}
			public void setpIdx(int pIdx) {
				this.pIdx = pIdx;
			}
			
			
			@Override
			public String toString() {
				return "CartVO [cartIdx=" + cartIdx + ", userIdx=" + userIdx + ", pIdx=" + pIdx + ", quant=" + quant
						+ ", totalPrice=" + totalPrice + "]";
			}
			
			
			

			
}
