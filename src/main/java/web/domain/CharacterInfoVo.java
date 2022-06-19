package web.domain;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CharacterInfoVo {

	// 사용자 정보
	private String idx;
	private String user_idx;
	private String character_name;
	private String level;
	private String c_level;
	private String server;
	private String class_;
	private Date createAt;
	private Date updateAt;
	
}
