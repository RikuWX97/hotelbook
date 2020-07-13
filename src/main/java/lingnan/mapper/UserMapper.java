package lingnan.mapper;

import lingnan.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {

    User login(@Param("name") String name, @Param("password") String password);

    User getById(Integer id);

    User getByName(String name);

    List<User> getList();

    List<User> findByAll(User user);
    
    boolean insert(User bean);

    boolean update(User bean);

    int deleteByIds(List<Integer> ids);
    
    int countAllUser();
    
    boolean updateLoginDate(User bean);

}
