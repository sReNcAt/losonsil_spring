package web.dao.user;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import web.domain.UserVo;


@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "user";

	@Override
	public UserVo create(UserVo vo) throws Exception {
		session.insert(namespace + ".create", vo);
		return vo;
	}

	@Override
	public UserVo read(UserVo vo) throws Exception {
		return session.selectOne(namespace + ".read", vo);
	}

	@Override
	public UserVo update(UserVo vo) throws Exception {
		session.update(namespace + ".update", vo);

		// 정보
		UserVo newVo = new UserVo();
		newVo = session.selectOne(namespace + ".read", newVo);

		return newVo;
	}

	@Override
	public void delete(UserVo vo) throws Exception {
		session.delete(namespace + ".delete", vo);
	}
	
	@Override
	public List<UserVo> all(UserVo vo) throws Exception {
		return session.selectList(namespace + ".all", vo);
	}
}
