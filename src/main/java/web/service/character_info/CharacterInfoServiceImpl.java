package web.service.character_info;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import web.domain.CharacterInfoVo;
import web.dao.character_info.CharacterInfoDAO;


@Service
public class CharacterInfoServiceImpl implements CharacterInfoService {

	@Inject
	private CharacterInfoDAO dao;

	@Override
	public CharacterInfoVo create(CharacterInfoVo vo) throws Exception {
		return dao.create(vo);
	}

	@Override
	public CharacterInfoVo read(CharacterInfoVo vo) throws Exception {
		return dao.read(vo);
	}

	@Override
	public CharacterInfoVo update(CharacterInfoVo vo) throws Exception {
		return dao.update(vo);
	}

	@Override
	public void delete(CharacterInfoVo vo) throws Exception {
		dao.delete(vo);
	}
	
	@Override
	public List<CharacterInfoVo> all(CharacterInfoVo vo) throws Exception {
		return dao.all(vo);
	}
}
