package api.controller;
import api.entity.db.HonorResult;

import api.service.IHonorService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Api(description = "平台登录注册", tags = "HonorControl", basePath = "/honor")
@Controller
@RequestMapping("/honor")
public class HonorController {

    @Autowired
    private IHonorService honorService;

    @RequestMapping("/getHonorByYear")
    public @ResponseBody List<HonorResult> getHonorByYear(Integer year){
        List<HonorResult> honors = honorService.get(year);
        return honors;
    }
}
