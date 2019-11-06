package api.dao;

import api.entity.HonorResult;

import java.util.List;

public interface HonorResultMapper {
    List<HonorResult> selectByYear(int year);
}
