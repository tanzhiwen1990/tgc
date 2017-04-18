package com.util;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;
/**
 * 基础Mapper,该接口不能被扫描
 * @author huxiuqin
 * @param <T>
 */

public interface BaseMapper<T> extends Mapper<T>,MySqlMapper<T> {

}
