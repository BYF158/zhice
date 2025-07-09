package com.etsong.questions.mapper;

import com.etsong.questions.domain.PrototypeScore;

/**
 * 原型得分Mapper接口
 */
public interface PrototypeScoreMapper {
    /**
     * 插入原型得分记录
     * @param prototypeScore 原型得分对象
     * @return 影响的行数
     */
    int insertPrototypeScore(PrototypeScore prototypeScore);
}