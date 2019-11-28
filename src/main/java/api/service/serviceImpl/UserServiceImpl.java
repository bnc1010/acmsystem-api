package api.service.serviceImpl;

import api.dao.UserMapper;
import api.entity.md.User;
import api.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * IUserService接口实现类
 */
@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService {

    @Autowired
    UserMapper userMapper;

    /**
     * 根据用户名和密码获取用户信息
     * @param userName
     * @param password
     * @return
     */
    @Override
    public User getUser(String userName, String password) {
        return userMapper.getUser(userName,password);
    }

    @Override
    public boolean isExist(String userName) {
        System.out.println(userName);
        return userMapper.getUserByUserName(userName) > 0;
    }
}
