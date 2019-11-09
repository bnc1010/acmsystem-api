package api.controller;

import api.entity.HttpResult;
import api.entity.User;
import api.service.ShiroService;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class LoginController {
    @Autowired
    private ShiroService shiroService;
    private Logger logger = Logger.getLogger(LoginController.class);
    /**
     * 验证登录
     * @param username
     * @param password
     * @return url
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public @ResponseBody
    HttpResult Login(String username, String password){
        HttpResult result = new HttpResult();
        result.setState(400);
        if(username==null){
            result.setMessage("fail");
            return result;
        }
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
            System.out.println("登录完成");
        } catch (UnknownAccountException e) {
            result.setMessage("fail");
            return result;
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
