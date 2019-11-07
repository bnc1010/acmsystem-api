package api.service.serviceImpl;

import api.dao.*;
import api.entity.HonorResult;
import api.entity.Members;
import api.service.HonorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class HonorServiceImpl implements HonorService {

    @Autowired
    HonorResultMapper honorResultMapper;

    @Autowired
    MembersMapper membersMapper;

    @Override
    public List<HonorResult> get(int year) {
        List<HonorResult> honorResults = new ArrayList<HonorResult>();
        honorResults = honorResultMapper.selectByYear(year);
        for(HonorResult hr : honorResults){
            Members m1 = membersMapper.selectByPrimaryKey(hr.getM1());
            Members m2 = membersMapper.selectByPrimaryKey(hr.getM2());
            Members m3 = membersMapper.selectByPrimaryKey(hr.getM3());
            hr.setN1(m1.getName());
            hr.setN2(m2.getName());
            hr.setN3(m3.getName());
        }
        return honorResults;
    }
}
