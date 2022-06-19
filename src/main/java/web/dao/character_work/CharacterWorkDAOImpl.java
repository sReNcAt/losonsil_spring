package web.dao.character_work;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import web.domain.CharacterWorkVo;


@Repository
public class CharacterWorkDAOImpl implements CharacterWorkDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "characterWork";

	@Override
	public CharacterWorkVo create(CharacterWorkVo vo) throws Exception {
		session.insert(namespace + ".create", vo);
		return vo;
	}

	@Override
	public CharacterWorkVo read(CharacterWorkVo vo) throws Exception {
		return session.selectOne(namespace + ".read", vo);
	}

	@Override
	public CharacterWorkVo update(CharacterWorkVo vo) throws Exception {
		session.update(namespace + ".update", vo);

		// 정보
		CharacterWorkVo newVo = new CharacterWorkVo();
		newVo = session.selectOne(namespace + ".read", newVo);

		return newVo;
	}

	@Override
	public void delete(CharacterWorkVo vo) throws Exception {
		session.delete(namespace + ".delete", vo);
	}
	
	@Override
	public List<CharacterWorkVo> all(CharacterWorkVo vo) throws Exception {
		return session.selectList(namespace + ".all", vo);
	}
}
