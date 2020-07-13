package lingnan.service;

import lingnan.pojo.User;

import java.util.List;

public interface UserService {

    User login(String name, String password);

    User getById(Integer id);

    User getByName(String name);

    List<User> getList();
    
    List<User> findByAll(User user);

    boolean insert(User bean);

    boolean update(User bean);
    
    boolean updateLoginDate(User bean);

    int deleteByIds(List<Integer> ids);
    
    int countAllUser();

  
}
