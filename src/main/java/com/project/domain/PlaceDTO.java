package com.project.domain;

import lombok.Data;

@Data
public class PlaceDTO {
	private int placenum;
	private double placelat;
	private double placelng;
	private String placename;
	private String placeaddr;
	private String placeroadaddr;
}
