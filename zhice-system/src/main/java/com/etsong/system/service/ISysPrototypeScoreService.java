package com.etsong.system.service;

import com.etsong.common.core.domain.entity.PrototypeScoreDTO;
import com.etsong.common.core.domain.entity.SysRole;
import com.etsong.common.core.domain.entity.SysUser;

import java.util.List;
import java.util.Map;

/**
 * 角色业务层
 *
 * @author ruoyi
 */
public interface ISysPrototypeScoreService
{

    List<PrototypeScoreDTO> selectScoreDetails();

    /**
     * 根据条件查询原型评分详情
     * @param params 查询参数
     * @return 包含用户名称、原型名称、分数和提交时间的结果列表
     */
    List<PrototypeScoreDTO> selectScoreDetailsByCondition(Map<String, Object> params);


    List<PrototypeScoreDTO> selectScoreDetailsByCondition2(SysUser sysUser);

    int deletePrototypeScoreByIds(Long[] recordIds);

    List<PrototypeScoreDTO> selectScoreDetailsByCondition3(PrototypeScoreDTO sysUser);
}
