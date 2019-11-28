package api.helper;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * 继承通用的Mapper
 */
public interface MyMapper<T> extends Mapper<T>, MySqlMapper<T> {

}
