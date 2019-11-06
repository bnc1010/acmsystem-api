package api.controller;
import api.entity.Honor;
import api.entity.HonorResult;
import api.service.serviceImpl.HonorServiceImpl;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller

public class HonorController {

    private HonorServiceImpl honorService;
    @RequestMapping("/getHonorByYear")
    public @ResponseBody List<HonorResult> getHonorByYear(Integer year){
        List<HonorResult> honors = honorService.get(year);
        return honors;
    }

}
