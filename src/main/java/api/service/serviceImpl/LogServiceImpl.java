package api.service.serviceImpl;

import api.dao.LogNameMapper;
import api.entity.db.LogName;
import api.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("logService")
public class LogServiceImpl extends BaseServiceImpl<LogName> implements ILogService {

    @Autowired
    LogNameMapper logNameMapper ;
}
