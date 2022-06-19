package web.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import web.domain.UserVo;
import web.dao.user.UserDAO;


@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	@Override
	public UserVo create(UserVo vo) throws Exception {
		return dao.create(vo);
	}

	@Override
	public UserVo read(UserVo vo) throws Exception {
		return dao.read(vo);
	}

	@Override
	public UserVo update(UserVo vo) throws Exception {
		return dao.update(vo);
	}

	@Override
	public void delete(UserVo vo) throws Exception {
		dao.delete(vo);
	}
	
	@Override
	public List<UserVo> all(UserVo vo) throws Exception {
		return dao.all(vo);
	}
}
