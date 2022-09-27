package com.project.domain;

import lombok.Data;

@Data
public class UserDTO {
	private int usernum;
	private String userid;
	private String userpw;
	private String usernickname;
	private String useremail;
	private String useremailopen;
	private String userkey;
	private String regdate;
}
