package web.dao.character_info;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import web.domain.CharacterInfoVo;


@Repository
public class CharacterInfoDAOImpl implements CharacterInfoDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "characterInfo";

	@Override
	public CharacterInfoVo create(CharacterInfoVo vo) throws Exception {
		session.insert(namespace + ".create", vo);
		return vo;
	}

	@Override
	public CharacterInfoVo read(CharacterInfoVo vo) throws Exception {
		return session.selectOne(namespace + ".read", vo);
	}

	@Override
	public CharacterInfoVo update(CharacterInfoVo vo) throws Exception {
		session.update(namespace + ".update", vo);

		// 정보
		CharacterInfoVo newVo = new CharacterInfoVo();
		newVo = session.selectOne(namespace + ".read", newVo);

		return newVo;
	}

	@Override
	public void delete(CharacterInfoVo vo) throws Exception {
		session.delete(namespace + ".delete", vo);
	}
	
	@Override
	public List<CharacterInfoVo> all(CharacterInfoVo vo) throws Exception {
		return session.selectList(namespace + ".all", vo);
	}
}
