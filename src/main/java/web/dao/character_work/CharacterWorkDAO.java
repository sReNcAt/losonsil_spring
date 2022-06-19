package web.dao.character_work;

import java.util.List;

import web.domain.CharacterWorkVo;


public interface CharacterWorkDAO {
	CharacterWorkVo create(CharacterWorkVo vo) throws Exception;

	CharacterWorkVo read(CharacterWorkVo vo) throws Exception;

	CharacterWorkVo update(CharacterWorkVo vo) throws Exception;

	void delete(CharacterWorkVo vo) throws Exception;
	
	List<CharacterWorkVo> all(CharacterWorkVo vo) throws Exception;
}
