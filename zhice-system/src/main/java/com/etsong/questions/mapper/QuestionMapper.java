package com.etsong.questions.mapper;

import com.etsong.questions.domain.PrototypeScore;
import com.etsong.questions.domain.Topic;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QuestionMapper {
    // 查询所有题目（PageHelper会自动处理分页）
    List<Topic> selectAll();

    // 如果需要单独查询总数，可以保留此方法
    int countAll();

    /**
     * 查询某个用户的测试记录对应的原型得分
     * @param recordId 测试记录ID
     * @return 原型得分列表（包含原型名称）
     */
    List<PrototypeScore> selectScoresByRecordId(@Param("recordId") Integer recordId);

}