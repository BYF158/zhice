package com.etsong.questions.mapper;

import com.etsong.questions.domain.TestRecord;

/**
 * 测试记录Mapper接口
 */
public interface TestRecordMapper {
    /**
     * 插入测试记录
     * @param testRecord 测试记录对象
     * @return 影响的行数
     */
    int insertTestRecord(TestRecord testRecord);

    Integer getRecordIdByUserId(Long userId);
}