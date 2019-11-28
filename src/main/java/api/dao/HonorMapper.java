package api.dao;

import api.entity.db.Honor;

import java.util.ArrayList;

public interface HonorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Honor record);

    int insertSelective(Honor record);

    Honor selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Honor record);

    int updateByPrimaryKey(Honor record);

    ArrayList<Honor> selectByYear(int year);
}