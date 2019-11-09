package api.service.serviceImpl;

import api.dao.ShiroMapper;
import api.entity.Permission;
import api.entity.User;
import api.service.ShiroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("shiroService")
public class ShiroServiceImpl implements ShiroService {

    @Autowired
    private ShiroMapper shiroMapper;

    public User getUserByUserName(String username) {
        //根据账号获取账号密码
        return shiroMapper.getUserByUserName(username);
    }

    public List<Permission> getPermissionsByUser(User user) {
        //获取到用户角色userRole
        List<Integer> roleId = shiroMapper.getUserRoleByUserId(user.getId());
        List<Permission> perArrary = new ArrayList<>();

        if (roleId!=null&&roleId.size()!=0) {
            //根据roleid获取peimission
            for (Integer i : roleId) {
                perArrary.addAll(shiroMapper.getPermissionsByRoleId(i));
            }
        }
        System.out.println(perArrary);
        return perArrary;
    }
}
