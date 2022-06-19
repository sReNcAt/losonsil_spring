package web.domain;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class UserVo {

	// 사용자 정보
	private String idx;
	private String user_name;
	private String user_pw;
	private String createAt;
	private String password;
	
}
