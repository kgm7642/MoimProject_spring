package com.project.domain;

import lombok.Data;

@Data
public class MoimDTO {
	private int moimnum;
	private String moimname;
	private String moimtype;
	private int moimbudget;
	private String startdate;
	private String enddate;
	private String userid;
	private int placenum;
	private int dislike;
	
	public void setMoimtypefirst(String[] moimtype) {
		this.moimtype = moimtype[0];
	}
}
