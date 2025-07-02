package com.etsong.questions.mapper;

import com.etsong.questions.domain.Topic;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface QuestionMapper {
    // 查询所有题目（PageHelper会自动处理分页）
    List<Topic> selectAll();

    // 如果需要单独查询总数，可以保留此方法
    int countAll();
}