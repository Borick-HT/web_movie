package edu.poly.domain;

import java.util.Date;

public class FavoriteReport {
	private String  videoTitle;
	private Long  favoriteCount;
	private Date  newDate;
	private Date  oldDate;
	
	
	public FavoriteReport() {
	}
	public FavoriteReport(String videoTitle, Long favoriteCount, Date newDate, Date oldDate) {
		this.videoTitle = videoTitle;
		this.favoriteCount = favoriteCount;
		this.newDate = newDate;
		this.oldDate = oldDate;
	}
	public String getVideoTitle() {
		return videoTitle;
	}
	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}
	public Long getFavoriteCount() {
		return favoriteCount;
	}
	public void setFavoriteCount(Long favoriteCount) {
		this.favoriteCount = favoriteCount;
	}
	public Date getNewDate() {
		return newDate;
	}
	public void setNewDate(Date newDate) {
		this.newDate = newDate;
	}
	public Date getOldDate() {
		return oldDate;
	}
	public void setOldDate(Date oldDate) {
		this.oldDate = oldDate;
	}


	
}
