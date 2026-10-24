package com.etsong.mbti.service;

import java.util.List;
import com.etsong.mbti.domain.MbtiQuestion;
import com.etsong.mbti.domain.MbtiRecord;
import com.etsong.mbti.domain.MbtiResultVO;
import com.etsong.mbti.domain.MbtiSubmitRequest;

/**
 * MBTI 测试 Service
 *
 * @author openclaw
 */
public interface IMbtiTestService
{
    /** 查询题库（仅正常状态） */
    List<MbtiQuestion> selectQuestionList();

    /** 提交答卷并计算结果 */
    MbtiResultVO submit(MbtiSubmitRequest request, Long userId, String loginName);

    /** 按记录ID获取结果 */
    MbtiResultVO selectResultById(Long recordId);

    /** 查询记录列表 */
    List<MbtiRecord> selectRecordList(MbtiRecord query);

    /** 批量删除记录 */
    int deleteRecordByIds(Long[] recordIds);
}
