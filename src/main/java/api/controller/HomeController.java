package api.controller;

import api.entity.md.HttpResult;
import api.service.IShiroService;
import api.service.IUserService;
import io.swagger.annotations.Api;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Api(description = "平台登录注册", tags = "HomeHandler", basePath = "/home")
@Controller
@RequestMapping("/home")
public class HomeController {

    private Logger logger = Logger.getLogger(HomeController.class);

    @Autowired
    private IShiroService shiroService;

    @Autowired
    private IUserService userService;

//    @Autowired
//    private IRedisTokenManager redisTokenManager;

    /**
     * 验证登录
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public @ResponseBody
    HttpResult Login(@RequestParam(value = "userName") String userName, @RequestParam(value = "password") String password){
        HttpResult result = new HttpResult();
//        User user = new User();
//
//        try {
//            password = MD5Util.encrypt(password);
//            user = userService.getUser(userName, password);
//            if (user == null) {
//                result.setCode(StatusCode.HTTP_FAILURE);
//                result.setMsg("Login failed, user name or password error！");
//            } else {
//                TokenModel token;
//                // 判断用户是否已经登录过，如果登录过，就将redis缓存中的token删除，重新创建新的token值，保证一个用户在一个时间段只有一个可用 Token
//                if (redisTokenManager.hasToken(user.getId())) {
//                    //清除过时的token
//                    redisTokenManager.deleteToken(user.getId());
//                    //创建token
//                    token = redisTokenManager.createToken(user.getId());
//                } else {
//                    //创建token
//                    token = redisTokenManager.createToken(user.getId());
//                }
//                Subject subject = SecurityUtils.getSubject();
//                //subject.login(token);
//                user = (User) subject.getPrincipal();
//            }
//        }
//        catch (Exception e){
//            result.setCode(StatusCode.HTTP_FAILURE);
//            result.setMsg("Login failed, user name or password error！");
//            logger.error("用户登录失败！参数信息：userName = " + userName + ",password = " + password, e);
//            e.printStackTrace();
//        }
        return result;
    }

    /**
     * 登出
     *
     */
//    @RequestMapping(value = "/logout",method = RequestMethod.POST)
//    public
}
