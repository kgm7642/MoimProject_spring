package com.project.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyProPageDTO {
	private int replyCnt;
	private List<MoimReplyDTO> list;
}
