package com.itwillbs.project_dos.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailAuthInfo {
	private String email;
	private String auth_code;
}
