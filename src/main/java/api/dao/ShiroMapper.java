package api.dao;

import api.entity.Permission;
import api.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ShiroMapper {

    /**
     * 根据账号获取账号密码
     * @param username
     * @return UserPojo
     */
    User getUserByUserName(@Param("username") String username);
    /**
     * 根据角色id获取该账号的权限
     * @param roleId
     * @return List
     */
    List<Permission> getPermissionsByRoleId(int roleId);

    /**
     * 根据userId获取角色id
     * @param id
     * @return LIST
     */
    List<Integer> getUserRoleByUserId(int id);

}
