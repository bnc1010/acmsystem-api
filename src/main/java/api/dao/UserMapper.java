package api.dao;

import api.entity.md.User;
import api.helper.MyMapper;
import org.apache.ibatis.annotations.Param;

public interface UserMapper extends MyMapper<User> {

    User getUser(@Param("userName") String userName, @Param("password") String password);

    int getUserByUserName(@Param("userName") String userName);
}