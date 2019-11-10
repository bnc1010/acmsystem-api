package api.controller;

import api.entity.HttpResult;
import api.entity.User;
import api.helper.MD5Util;
import api.service.ShiroService;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.security.provider.MD5;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class LoginController {
    @Autowired
    private ShiroService shiroService;
    private Logger logger = Logger.getLogger(LoginController.class);
    /**
     * 验证登录
     * @return url
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public @ResponseBody
    HttpResult Login(@RequestBody User loginUser){
        HttpResult result = new HttpResult();
        result.setState(400);
        String username = loginUser.getAccount();
        String password = loginUser.getPassword();
        System.out.println(username);
        System.out.println(password);
        if(username==null||username.length()>20 || password.length()>25){
            result.setMessage("fail");
            return result;
        }
        password = MD5Util.getMD5(password);
        System.out.println(password);
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        User user;
        try {
            System.out.println("========================================");
            System.out.println("1、进入认证方法");
            subject.login(token);
            user = (User)subject.getPrincipal();
            result.setState(200);
            result.setMessage("success");
            result.setData(user.getAccount());
        } catch (UnknownAccountException e) {
            result.setState(400);
            result.setMessage("fail");
        }
        return result;
    }

    @RequestMapping("/check")
    public String check(HttpSession session){
        Subject subject=(Subject)session.getAttribute("user");
        User user=(User)subject.getPrincipal();
        System.out.println(user.toString());
        return "permission";
    }

    @RequestMapping("/readName")
    public String readName(HttpSession session){

        return "name";
    }

    @RequestMapping("/readData")
    public String readData(){

        return "data";
    }

    @RequestMapping("/nopermission")
    public String noPermission(){
        return "error";
    }
}
