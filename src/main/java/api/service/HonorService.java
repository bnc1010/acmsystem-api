package api.service;

import api.entity.HonorResult;

import java.util.List;

public interface HonorService {
    List<HonorResult> get(int year);
}
