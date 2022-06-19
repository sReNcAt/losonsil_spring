package web.domain;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CharacterWorkVo {

	// 사용자 정보
	private String idx;
	private String character_idx;
	private String work_type;
	private String workGubun;
	private String workStatus;
	private String workDate;
	private String workTime;
	private Date createAt;
	private Date updateAt;
}
