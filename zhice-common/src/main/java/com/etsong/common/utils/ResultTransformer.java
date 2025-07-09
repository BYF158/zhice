package com.etsong.common.utils;

import com.etsong.common.core.domain.entity.PrototypeScoreDTO;
import com.etsong.common.core.domain.entity.PrototypeScoreVO;

import java.util.*;
import java.text.SimpleDateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class ResultTransformer {
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");

    public static List<PrototypeScoreVO> transform(List<PrototypeScoreDTO> originalData) {
        // 使用userName + submitTime作为唯一键
        Map<String, PrototypeScoreVO> resultMap = new LinkedHashMap<>();

        for (PrototypeScoreDTO dto : originalData) {
            String submitTimeStr = dateFormat.format(dto.getSubmitTime());
            String key = dto.getUserName() + "|" + submitTimeStr;

            PrototypeScoreVO vo = resultMap.computeIfAbsent(key, k -> {
                PrototypeScoreVO newVo = new PrototypeScoreVO();
                newVo.setRecordId(dto.getRecordId());
                newVo.setUserName(dto.getUserName());
                newVo.setSubmitTime(dto.getSubmitTime());
                return newVo;
            });

            // 根据顺序设置prototypeName和score
            setPrototypeScore(vo, dto.getPrototypeName(), dto.getScore());
        }

        return new ArrayList<>(resultMap.values());
    }

    private static void setPrototypeScore(PrototypeScoreVO vo, String prototypeName, Integer score) {
        if (vo.getPrototypeName1() == null) {
            vo.setPrototypeName1(prototypeName);
            vo.setScore1(score);
        } else if (vo.getPrototypeName2() == null) {
            vo.setPrototypeName2(prototypeName);
            vo.setScore2(score);
        } else if (vo.getPrototypeName3() == null) {
            vo.setPrototypeName3(prototypeName);
            vo.setScore3(score);
        } else if (vo.getPrototypeName4() == null) {
            vo.setPrototypeName4(prototypeName);
            vo.setScore4(score);
        } else if (vo.getPrototypeName5() == null) {
            vo.setPrototypeName5(prototypeName);
            vo.setScore5(score);
        } else if (vo.getPrototypeName6() == null) {
            vo.setPrototypeName6(prototypeName);
            vo.setScore6(score);
        } else if (vo.getPrototypeName7() == null) {
            vo.setPrototypeName7(prototypeName);
            vo.setScore7(score);
        } else if (vo.getPrototypeName8() == null) {
            vo.setPrototypeName8(prototypeName);
            vo.setScore8(score);
        } else if (vo.getPrototypeName9() == null) {
            vo.setPrototypeName9(prototypeName);
            vo.setScore9(score);
        } else if (vo.getPrototypeName10() == null) {
            vo.setPrototypeName10(prototypeName);
            vo.setScore10(score);
        } else if (vo.getPrototypeName11() == null) {
            vo.setPrototypeName11(prototypeName);
            vo.setScore11(score);
        } else if (vo.getPrototypeName12() == null) {
            vo.setPrototypeName12(prototypeName);
            vo.setScore12(score);
        } else {
            // 如果超过12个，可以选择忽略或抛出异常
            throw new IllegalStateException("PrototypeScoreVO 只支持最多12个原型分数");
        }
    }
}
