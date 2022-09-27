package com.project.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MoimChatListDTO {
	private List<MoimChatDTO> list;
}
