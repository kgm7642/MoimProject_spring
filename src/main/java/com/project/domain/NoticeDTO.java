package com.project.domain;

import lombok.Data;

@Data
public class NoticeDTO {
	private int noticenum;
	private String userid;
	private String noticetitle;
	private String contents;
	private String regdate;
	private int views;
}
