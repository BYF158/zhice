package com.etsong.system.service;

import com.etsong.common.core.domain.entity.PrototypeScoreDTO;
import com.etsong.common.core.domain.entity.SysUser;

import java.util.List;
import java.util.Map;

/**
 * 角色业务层
 *
 * @author ruoyi
 */
public interface ISysTestRecordService
{

    int deleteTestRecordByIds(Long[] recordIds);
}
