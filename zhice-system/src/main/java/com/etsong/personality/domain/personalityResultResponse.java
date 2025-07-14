package com.etsong.personality.domain;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Map;

/**
 * 用户心理测试结果及最高分类型响应类
 */
@Setter
@Getter
@Data
public class personalityResultResponse {

    private Long userId;
    private Integer highestScore;
    private List<String> highestTypes;
    private Map<String, String> typeDescriptions;

}
