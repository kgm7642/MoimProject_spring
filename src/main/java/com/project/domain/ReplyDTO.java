package com.project.domain;

import lombok.Data;

@Data
public class ReplyDTO {
	private int replynum;
	private int boardnum;
	private String contents;
	private String userid;
	private String regdate;
	private String updatedate;
}