package com.etsong.questions.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.etsong.questions.mapper.TopicMapper;
import com.etsong.questions.domain.Topic;
import com.etsong.questions.service.ITopicService;

/**
 * 题目管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-07-01
 */
@Service
public class TopicServiceImpl implements ITopicService 
{
    @Autowired
    private TopicMapper topicMapper;

    /**
     * 查询题目管理
     * 
     * @param topicId 题目管理主键
     * @return 题目管理
     */
    @Override
    public Topic selectTopicByTopicId(Long topicId)
    {
        return topicMapper.selectTopicByTopicId(topicId);
    }

    /**
     * 查询题目管理列表
     * 
     * @param topic 题目管理
     * @return 题目管理
     */
    @Override
    public List<Topic> selectTopicList(Topic topic)
    {
        return topicMapper.selectTopicList(topic);
    }

    /**
     * 新增题目管理
     * 
     * @param topic 题目管理
     * @return 结果
     */
    @Override
    public int insertTopic(Topic topic)
    {
        return topicMapper.insertTopic(topic);
    }

    /**
     * 修改题目管理
     * 
     * @param topic 题目管理
     * @return 结果
     */
    @Override
    public int updateTopic(Topic topic)
    {
        return topicMapper.updateTopic(topic);
    }

    /**
     * 批量删除题目管理
     * 
     * @param topicIds 需要删除的题目管理主键
     * @return 结果
     */
    @Override
    public int deleteTopicByTopicIds(Long[] topicIds)
    {
        return topicMapper.deleteTopicByTopicIds(topicIds);
    }

    /**
     * 删除题目管理信息
     * 
     * @param topicId 题目管理主键
     * @return 结果
     */
    @Override
    public int deleteTopicByTopicId(Long topicId)
    {
        return topicMapper.deleteTopicByTopicId(topicId);
    }
}
