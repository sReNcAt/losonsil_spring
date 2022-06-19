package web.service.character_info;

import java.util.List;

import web.domain.CharacterInfoVo;


public interface CharacterInfoService {
	CharacterInfoVo create(CharacterInfoVo vo) throws Exception;

	CharacterInfoVo read(CharacterInfoVo vo) throws Exception;

	CharacterInfoVo update(CharacterInfoVo vo) throws Exception;

	void delete(CharacterInfoVo vo) throws Exception;
	
	List<CharacterInfoVo> all(CharacterInfoVo vo) throws Exception;
}
