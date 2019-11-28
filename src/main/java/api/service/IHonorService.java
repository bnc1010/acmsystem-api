package api.service;

import api.entity.db.HonorResult;

import java.util.List;

public interface IHonorService {
    List<HonorResult> get(int year);
}
