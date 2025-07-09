package com.etsong.system.service.impl;

import com.etsong.common.core.domain.entity.PrototypeScoreDTO;
import com.etsong.common.core.domain.entity.SysUser;
import com.etsong.common.core.domain.entity.TestRecordS;
import com.etsong.system.mapper.*;

import com.etsong.system.service.ISysPrototypeScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * 角色 业务层处理
 *
 * @author ruoyi
 */
@Service
public class SysPrototypeScoreServiceImpl implements ISysPrototypeScoreService
{
    @Autowired
    private SysPrototypeScoreMapper prototypeScoreMapper;

    @Autowired
    private SysTestRecordMapper testRecordMapper;

    @Autowired
    private SysUserMapper userMapper;


    @Override
    public List<PrototypeScoreDTO> selectScoreDetails() {
        return prototypeScoreMapper.selectScoreDetails();
    }

    @Override
    public List<PrototypeScoreDTO> selectScoreDetailsByCondition(Map<String, Object> params) {
        return prototypeScoreMapper.selectScoreDetailsByCondition(params);
    }

    @Override
    public List<PrototypeScoreDTO> selectScoreDetailsByCondition2(SysUser sysUser) {
        return prototypeScoreMapper.selectScoreDetailsByCondition2(sysUser);
    }

    @Override
    @Transactional
    public int deletePrototypeScoreByIds(Long[] recordIds) {

        testRecordMapper.deleteTopicAnswerByIds(recordIds);

        int i = prototypeScoreMapper.deletePrototypeScoreByIds(recordIds);
        //删除关联记录
        testRecordMapper.deleteTestRecordByIds(recordIds);
        return i;
    }

    @Override
    public List<PrototypeScoreDTO> selectScoreDetailsByCondition3(PrototypeScoreDTO sysUser) {
        //查用户id
        SysUser sysUser1 = userMapper.selectUserByUserName(sysUser.getUserName());
        //查用户最新时间
        TestRecordS testRecordS =testRecordMapper.selectTestRecordByUserId(sysUser1.getUserId());
        //查最新一组得分
        PrototypeScoreDTO sysUser2 = new PrototypeScoreDTO();
        sysUser2.setUserName(sysUser1.getUserName());
        sysUser2.setSubmitTime(testRecordS.getSubmitTime());
        return prototypeScoreMapper.selectScoreDetailsByCondition3(sysUser2);
    }
}
