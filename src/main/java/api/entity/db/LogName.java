package api.entity.db;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class LogName {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer lId;

    /**
     * 日志名称
     */
    @Column(name = "log_name")
    private String logName;
}
