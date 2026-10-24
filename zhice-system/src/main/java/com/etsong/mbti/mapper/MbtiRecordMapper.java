package com.etsong.mbti.mapper;

import java.util.List;
import com.etsong.mbti.domain.MbtiRecord;

/**
 * MBTI 测试记录 Mapper
 *
 * @author openclaw
 */
public interface MbtiRecordMapper
{
    int insertMbtiRecord(MbtiRecord record);

    MbtiRecord selectMbtiRecordById(Long recordId);

    List<MbtiRecord> selectMbtiRecordList(MbtiRecord query);

    int deleteMbtiRecordByIds(Long[] recordIds);
}
