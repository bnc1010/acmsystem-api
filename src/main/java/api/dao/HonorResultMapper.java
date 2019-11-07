package api.dao;

import api.entity.HonorResult;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HonorResultMapper {
    List<HonorResult> selectByYear(@Param("year") int year);
}
