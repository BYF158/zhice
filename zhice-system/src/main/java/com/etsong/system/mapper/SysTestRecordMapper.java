package com.etsong.system.mapper;

import com.etsong.common.core.domain.entity.TestRecordS;

/**
 * 角色表 数据层
 *
 * @author ruoyi
 */
public interface SysTestRecordMapper
{

    int deleteTestRecordByIds(Long[] recordIds);

    TestRecordS selectTestRecordByUserId(Long userId);

    int deleteTopicAnswerByIds(Long[] recordIds);

}
