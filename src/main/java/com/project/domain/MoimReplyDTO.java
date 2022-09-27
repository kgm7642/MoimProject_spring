package com.project.domain;

import lombok.Data;

@Data
public class MoimReplyDTO {
	private int replynum;
	private int recruitnum;
	private String userid;
	private String contents;
	private String regdate;
	private String updatedate;
}
