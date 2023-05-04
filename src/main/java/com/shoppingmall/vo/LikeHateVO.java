package com.shoppingmall.vo;

public class LikeHateVO {

	private int likeIdx;
	private int likeCheck;
	private int reviewIdx;
	private int userIdx;

	public int getLikeIdx() {
		return likeIdx;
	}

	public void setLikeIdx(int likeIdx) {
		this.likeIdx = likeIdx;
	}

	public int getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}

	public int getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	@Override
	public String toString() {
		return "LikeHateVO [likeIdx=" + likeIdx + ", likeCheck=" + likeCheck + ", reviewIdx=" + reviewIdx + ", userIdx="
				+ userIdx + "]";
	}

}
