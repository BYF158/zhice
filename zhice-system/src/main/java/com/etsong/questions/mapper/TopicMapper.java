package com.etsong.questions.mapper;

import java.util.List;
import com.etsong.questions.domain.Topic;

/**
 * 题目管理Mapper接口
 * 
 * @author ruoyi
 * @date 2025-07-01
 */
public interface TopicMapper 
{
    /**
     * 查询题目管理
     * 
     * @param topicId 题目管理主键
     * @return 题目管理
     */
    public Topic selectTopicByTopicId(Long topicId);

    /**
     * 查询题目管理列表
     * 
     * @param topic 题目管理
     * @return 题目管理集合
     */
    public List<Topic> selectTopicList(Topic topic);

    /**
     * 新增题目管理
     * 
     * @param topic 题目管理
     * @return 结果
     */
    public int insertTopic(Topic topic);

    /**
     * 修改题目管理
     * 
     * @param topic 题目管理
     * @return 结果
     */
    public int updateTopic(Topic topic);

    /**
     * 删除题目管理
     * 
     * @param topicId 题目管理主键
     * @return 结果
     */
    public int deleteTopicByTopicId(Long topicId);

    /**
     * 批量删除题目管理
     * 
     * @param topicIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTopicByTopicIds(Long[] topicIds);
}
