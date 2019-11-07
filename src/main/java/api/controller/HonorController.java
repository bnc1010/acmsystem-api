package api.controller;
import api.entity.HonorResult;
import api.service.HonorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller

public class HonorController {

    @Autowired
    private HonorService honorService;

    @RequestMapping("/getHonorByYear")
    public @ResponseBody List<HonorResult> getHonorByYear(Integer year){
        List<HonorResult> honors = honorService.get(year);
        return honors;
    }
}
