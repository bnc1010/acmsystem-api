package api.dao;

import api.entity.db.Members;

public interface MembersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Members record);

    int insertSelective(Members record);

    Members selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Members record);

    int updateByPrimaryKey(Members record);
}