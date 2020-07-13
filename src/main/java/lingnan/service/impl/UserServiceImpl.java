package lingnan.service.impl;

import lingnan.mapper.UserMapper;
import lingnan.pojo.User;
import lingnan.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    public User login(String name, String password) {
        return userMapper.login(name,password);
    }

    public User getById(Integer id) {
        return userMapper.getById(id);
    }

    public User getByName(String name) {
        return userMapper.getByName(name);
    }

    public List<User> getList() {
        return userMapper.getList();
    }

    public boolean insert(User bean) {
        return userMapper.insert(bean);
    }

    public boolean update(User bean) {
        return userMapper.update(bean);
    }

    public int deleteByIds(List<Integer> ids) {
        return userMapper.deleteByIds(ids);
    }

	public int countAllUser() {
		return userMapper.countAllUser();
	}

	public List<User> findByAll(User user) {
		return userMapper.findByAll(user);
	}

	public boolean updateLoginDate(User bean) {
		return userMapper.updateLoginDate(bean);
	}
}
