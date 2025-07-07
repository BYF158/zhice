package com.etsong.questions.service.impl;

import com.etsong.questions.domain.*;
import com.etsong.questions.mapper.*;
import com.etsong.questions.service.QuestionService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 题目相关服务实现类
 */
@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private TestRecordMapper testRecordMapper;
    @Autowired
    private TopicAnswerMapper topicAnswerMapper;
    @Autowired
    private PrototypeScoreMapper prototypeScoreMapper;
    @Autowired
    private TopicMapper topicMapper;

    //
    @Autowired
    private QuestionMapper questionMapper;

    @Override
    public PageInfo<Topic> getQuestionByPage(Integer pageNum, Integer pageSize) {
        // 使用PageHelper插件进行分页查询
        PageHelper.startPage(pageNum, pageSize);

        // 执行查询，PageHelper会自动拦截并处理分页
        List<Topic> topics = questionMapper.selectAll();

        // 封装分页信息到PageInfo对象
        return new PageInfo<>(topics);
    }

    /**
     * 处理前端提交的题目数据并存储到数据库
     * @param answers 前端提交的题目答案
     * @param userId 用户ID
     * @return 是否成功
     */
    @Transactional
    public Integer processAndStoreAnswers(List<AnswerDTO.AnswerItem> answers, Long userId) {
        try {
            // 插入答题记录
            TestRecord testRecord = new TestRecord();
            testRecord.setUserId(userId);
            testRecord.setSubmitTime(LocalDateTime.now());
            testRecordMapper.insertTestRecord(testRecord);

            Integer recordId = testRecord.getRecordId();

            // 计算每个原型的总分
            Map<Integer, Integer> prototypeScores = new HashMap<>();

            for (AnswerDTO.AnswerItem answer : answers) {
                Integer topicId = answer.getTopicId();
                Integer score = answer.getScore();

                // 插入题目作答记录
                TopicAnswer topicAnswer = new TopicAnswer();
                topicAnswer.setRecordId(recordId);
                topicAnswer.setTopicId(topicId);
                topicAnswer.setScore(score);
                topicAnswerMapper.insertTopicAnswer(topicAnswer);

                // 获取题目对应的原型ID
                Topic topic = topicMapper.selectTopicByTopicId(Long.valueOf(topicId));
                Integer prototypeId = topic.getPrototypeId();

                // 累加原型分数
                prototypeScores.put(prototypeId, prototypeScores.getOrDefault(prototypeId, 0) + score);
            }

            // 插入原型得分记录
            for (Map.Entry<Integer, Integer> entry : prototypeScores.entrySet()) {
                PrototypeScore prototypeScore = new PrototypeScore();
                prototypeScore.setRecordId(recordId);
                prototypeScore.setPrototypeId(entry.getKey());
                prototypeScore.setScore(entry.getValue());
                prototypeScoreMapper.insertPrototypeScore(prototypeScore);
            }

            return recordId;
        } catch (Exception e) {
            // 异常情况下事务将回滚
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public PersonalityScoreResponse getPersonalityScores(Integer recordId) {
        List<PrototypeScore> scores = questionMapper.selectScoresByRecordId(recordId);

        PersonalityScoreResponse response = new PersonalityScoreResponse();
        List<PersonalityScoreResponse.ScoreItem> scoreItems = scores.stream().map(score -> {
            PersonalityScoreResponse.ScoreItem item = new PersonalityScoreResponse.ScoreItem();
            item.setName(score.getPrototypeName());
            item.setScore(score.getScore());
            return item;
        }).collect(Collectors.toList());

        response.setScores(scoreItems);
        return response;
    }
}