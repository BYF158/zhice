package com.etsong.personality.service.impl;

import java.util.List;

import com.etsong.personality.mapper.OptionsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.etsong.personality.domain.Options;
import com.etsong.personality.service.OptionsService;

/**
 * 选项管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-07-11
 */
@Service
public class OptionsServiceImpl implements OptionsService
{
    @Autowired
    private OptionsMapper optionsMapper;

    /**
     * 查询选项管理
     * 
     * @param optionId 选项管理主键
     * @return 选项管理
     */
    @Override
    public Options selectPersonalityOptionsByOptionId(Long optionId)
    {
        return optionsMapper.selectPersonalityOptionsByOptionId(optionId);
    }

    /**
     * 查询选项管理列表
     * 
     * @param options 选项管理
     * @return 选项管理
     */
    @Override
    public List<Options> selectPersonalityOptionsList(Options options)
    {
        return optionsMapper.selectPersonalityOptionsList(options);
    }

    /**
     * 新增选项管理
     * 
     * @param options 选项管理
     * @return 结果
     */
    @Override
    public int insertPersonalityOptions(Options options)
    {
        return optionsMapper.insertPersonalityOptions(options);
    }

    /**
     * 修改选项管理
     * 
     * @param options 选项管理
     * @return 结果
     */
    @Override
    public int updatePersonalityOptions(Options options)
    {
        return optionsMapper.updatePersonalityOptions(options);
    }

    /**
     * 批量删除选项管理
     * 
     * @param optionIds 需要删除的选项管理主键
     * @return 结果
     */
    @Override
    public int deletePersonalityOptionsByOptionIds(Long[] optionIds)
    {
        return optionsMapper.deletePersonalityOptionsByOptionIds(optionIds);
    }

    /**
     * 删除选项管理信息
     * 
     * @param optionId 选项管理主键
     * @return 结果
     */
    @Override
    public int deletePersonalityOptionsByOptionId(Long optionId)
    {
        return optionsMapper.deletePersonalityOptionsByOptionId(optionId);
    }
}
