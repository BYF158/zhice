package com.etsong.system.service.impl;

import com.etsong.common.core.domain.entity.PrototypeScoreDTO;
import com.etsong.common.core.domain.entity.SysUser;
import com.etsong.system.mapper.SysPrototypeScoreMapper;
import com.etsong.system.mapper.SysTestRecordMapper;
import com.etsong.system.service.ISysPrototypeScoreService;
import com.etsong.system.service.ISysTestRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 角色 业务层处理
 *
 * @author ruoyi
 */
@Service
public class SysTestRecordServiceImpl implements ISysTestRecordService
{
    @Autowired
    private SysTestRecordMapper testRecordMapper;


    @Override
    @Transactional
    public int deleteTestRecordByIds(Long[] recordIds) {


        return testRecordMapper.deleteTestRecordByIds(recordIds);
    }
}
