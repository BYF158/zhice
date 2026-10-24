package com.etsong.mbti.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etsong.common.exception.ServiceException;
import com.etsong.common.utils.StringUtils;
import com.etsong.mbti.domain.MbtiAnswer;
import com.etsong.mbti.domain.MbtiAnswerItem;
import com.etsong.mbti.domain.MbtiDimensionVO;
import com.etsong.mbti.domain.MbtiQuestion;
import com.etsong.mbti.domain.MbtiRecord;
import com.etsong.mbti.domain.MbtiResultVO;
import com.etsong.mbti.domain.MbtiSubmitRequest;
import com.etsong.mbti.mapper.MbtiAnswerMapper;
import com.etsong.mbti.mapper.MbtiQuestionMapper;
import com.etsong.mbti.mapper.MbtiRecordMapper;
import com.etsong.mbti.mapper.MbtiTypeMapper;
import com.etsong.mbti.service.IMbtiTestService;

/**
 * MBTI 测试 Service 实现
 *
 * 计分规则：题库中每个选项标注所属极（E/I、S/N、T/F、J/P），
 * 每选择一次对应极 +1，四个维度分别取高分极组成四位类型代码。
 *
 * @author openclaw
 */
@Service
public class MbtiTestServiceImpl implements IMbtiTestService
{
    /** 维度元数据：维度 -> {维度名称, 左极, 右极, 左极中文, 右极中文} */
    private static final Map<String, String[]> DIMENSION_META = new LinkedHashMap<String, String[]>();

    /** 八个极的固定顺序 */
    private static final String[] ALL_POLES = { "E", "I", "S", "N", "T", "F", "J", "P" };

    static
    {
        DIMENSION_META.put("EI", new String[] { "精力方向", "E", "I", "外向", "内向" });
        DIMENSION_META.put("SN", new String[] { "认知方式", "S", "N", "实感", "直觉" });
        DIMENSION_META.put("TF", new String[] { "决策依据", "T", "F", "思考", "情感" });
        DIMENSION_META.put("JP", new String[] { "生活态度", "J", "P", "判断", "知觉" });
    }

    @Autowired
    private MbtiQuestionMapper mbtiQuestionMapper;

    @Autowired
    private MbtiRecordMapper mbtiRecordMapper;

    @Autowired
    private MbtiAnswerMapper mbtiAnswerMapper;

    @Autowired
    private MbtiTypeMapper mbtiTypeMapper;

    @Override
    public List<MbtiQuestion> selectQuestionList()
    {
        MbtiQuestion query = new MbtiQuestion();
        query.setStatus("0");
        return mbtiQuestionMapper.selectMbtiQuestionList(query);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public MbtiResultVO submit(MbtiSubmitRequest request, Long userId, String loginName)
    {
        if (request == null || request.getAnswers() == null || request.getAnswers().isEmpty())
        {
            throw new ServiceException("请先完成答题后再提交");
        }

        List<MbtiQuestion> questions = selectQuestionList();
        if (questions.isEmpty())
        {
            throw new ServiceException("题库为空，请先维护 MBTI 题目");
        }

        Map<Long, MbtiQuestion> questionMap = new HashMap<Long, MbtiQuestion>();
        for (MbtiQuestion q : questions)
        {
            questionMap.put(q.getQuestionId(), q);
        }

        Map<String, Integer> scores = new HashMap<String, Integer>();
        for (String pole : ALL_POLES)
        {
            scores.put(pole, 0);
        }

        List<MbtiAnswer> answers = new ArrayList<MbtiAnswer>();
        for (MbtiAnswerItem item : request.getAnswers())
        {
            if (item == null || item.getQuestionId() == null || StringUtils.isEmpty(item.getChoice()))
            {
                continue;
            }
            MbtiQuestion question = questionMap.get(item.getQuestionId());
            if (question == null)
            {
                continue;
            }
            String choice = item.getChoice().trim().toUpperCase();
            String pole;
            if ("A".equals(choice))
            {
                pole = question.getOptionAPole();
            }
            else if ("B".equals(choice))
            {
                pole = question.getOptionBPole();
            }
            else
            {
                continue;
            }
            if (StringUtils.isEmpty(pole) || !scores.containsKey(pole))
            {
                continue;
            }
            scores.put(pole, scores.get(pole) + 1);

            MbtiAnswer answer = new MbtiAnswer();
            answer.setQuestionId(question.getQuestionId());
            answer.setChoice(choice);
            answers.add(answer);
        }

        if (answers.isEmpty())
        {
            throw new ServiceException("答题数据无效，请重新作答");
        }

        String resultType = resolveType(scores);

        MbtiRecord record = new MbtiRecord();
        record.setUserId(userId);
        String userName = StringUtils.isNotEmpty(request.getUserName()) ? request.getUserName()
                : (StringUtils.isNotEmpty(loginName) ? loginName : "匿名用户");
        record.setUserName(userName);
        record.setResultType(resultType);
        record.setScoreE(scores.get("E"));
        record.setScoreI(scores.get("I"));
        record.setScoreS(scores.get("S"));
        record.setScoreN(scores.get("N"));
        record.setScoreT(scores.get("T"));
        record.setScoreF(scores.get("F"));
        record.setScoreJ(scores.get("J"));
        record.setScoreP(scores.get("P"));
        record.setDuration(request.getDuration() == null ? 0 : request.getDuration());
        record.setTestTime(new Date());
        mbtiRecordMapper.insertMbtiRecord(record);

        for (MbtiAnswer answer : answers)
        {
            answer.setRecordId(record.getRecordId());
        }
        mbtiAnswerMapper.batchInsertMbtiAnswer(answers);

        return buildResult(record);
    }

    @Override
    public MbtiResultVO selectResultById(Long recordId)
    {
        MbtiRecord record = mbtiRecordMapper.selectMbtiRecordById(recordId);
        if (record == null)
        {
            throw new ServiceException("测试记录不存在");
        }
        return buildResult(record);
    }

    @Override
    public List<MbtiRecord> selectRecordList(MbtiRecord query)
    {
        return mbtiRecordMapper.selectMbtiRecordList(query);
    }

    @Override
    public int deleteRecordByIds(Long[] recordIds)
    {
        return mbtiRecordMapper.deleteMbtiRecordByIds(recordIds);
    }

    /**
     * 根据八个极的得分计算四位类型代码，得分相同时取左侧极（E/S/T/J）
     */
    private String resolveType(Map<String, Integer> scores)
    {
        StringBuilder type = new StringBuilder(4);
        for (Map.Entry<String, String[]> entry : DIMENSION_META.entrySet())
        {
            String left = entry.getValue()[1];
            String right = entry.getValue()[2];
            int leftScore = scores.get(left) == null ? 0 : scores.get(left);
            int rightScore = scores.get(right) == null ? 0 : scores.get(right);
            type.append(leftScore >= rightScore ? left : right);
        }
        return type.toString();
    }

    /**
     * 组装结果视图
     */
    private MbtiResultVO buildResult(MbtiRecord record)
    {
        MbtiResultVO vo = new MbtiResultVO();
        vo.setRecordId(record.getRecordId());
        vo.setResultType(record.getResultType());
        vo.setUserName(record.getUserName());
        vo.setDuration(record.getDuration());
        vo.setTestTime(record.getTestTime());

        Map<String, Integer> scores = new HashMap<String, Integer>();
        scores.put("E", record.getScoreE() == null ? 0 : record.getScoreE());
        scores.put("I", record.getScoreI() == null ? 0 : record.getScoreI());
        scores.put("S", record.getScoreS() == null ? 0 : record.getScoreS());
        scores.put("N", record.getScoreN() == null ? 0 : record.getScoreN());
        scores.put("T", record.getScoreT() == null ? 0 : record.getScoreT());
        scores.put("F", record.getScoreF() == null ? 0 : record.getScoreF());
        scores.put("J", record.getScoreJ() == null ? 0 : record.getScoreJ());
        scores.put("P", record.getScoreP() == null ? 0 : record.getScoreP());

        List<MbtiDimensionVO> dimensions = new ArrayList<MbtiDimensionVO>();
        for (Map.Entry<String, String[]> entry : DIMENSION_META.entrySet())
        {
            String[] meta = entry.getValue();
            String left = meta[1];
            String right = meta[2];
            int leftScore = scores.get(left);
            int rightScore = scores.get(right);
            int total = leftScore + rightScore;
            int leftPercent = total == 0 ? 50 : (int) Math.round(leftScore * 100.0 / total);

            MbtiDimensionVO dim = new MbtiDimensionVO();
            dim.setDimension(entry.getKey());
            dim.setDimensionName(meta[0]);
            dim.setLeftPole(left);
            dim.setRightPole(right);
            dim.setLeftLabel(meta[3]);
            dim.setRightLabel(meta[4]);
            dim.setLeftScore(leftScore);
            dim.setRightScore(rightScore);
            dim.setLeftPercent(leftPercent);
            dim.setRightPercent(100 - leftPercent);
            dim.setDominant(leftScore >= rightScore ? left : right);
            dimensions.add(dim);
        }
        vo.setDimensions(dimensions);
        vo.setType(mbtiTypeMapper.selectMbtiTypeByCode(record.getResultType()));
        return vo;
    }
}
