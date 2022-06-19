package web.dao.user;

import java.util.List;

import web.domain.UserVo;


public interface UserDAO {
	UserVo create(UserVo vo) throws Exception;

	UserVo read(UserVo vo) throws Exception;

	UserVo update(UserVo vo) throws Exception;

	void delete(UserVo vo) throws Exception;
	
	List<UserVo> all(UserVo vo) throws Exception;
}
