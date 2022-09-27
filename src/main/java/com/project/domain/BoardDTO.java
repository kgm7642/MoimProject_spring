package com.project.domain;

import lombok.Data;

@Data
public class BoardDTO {
	private int boardnum;
	private String userid;
	private String boardtitle;
	private String contents;
	private int category;
	private String regdate;
	private int views;
	private int likes;
	private int dislike;
}
