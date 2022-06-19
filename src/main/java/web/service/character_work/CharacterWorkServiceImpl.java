package web.service.character_work;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import web.domain.CharacterWorkVo;
import web.dao.character_work.CharacterWorkDAO;


@Service
public class CharacterWorkServiceImpl implements CharacterWorkService {

	@Inject
	private CharacterWorkDAO dao;

	@Override
	public CharacterWorkVo create(CharacterWorkVo vo) throws Exception {
		return dao.create(vo);
	}

	@Override
	public CharacterWorkVo read(CharacterWorkVo vo) throws Exception {
		return dao.read(vo);
	}

	@Override
	public CharacterWorkVo update(CharacterWorkVo vo) throws Exception {
		return dao.update(vo);
	}

	@Override
	public void delete(CharacterWorkVo vo) throws Exception {
		dao.delete(vo);
	}
	
	@Override
	public List<CharacterWorkVo> all(CharacterWorkVo vo) throws Exception {
		return dao.all(vo);
	}
}
