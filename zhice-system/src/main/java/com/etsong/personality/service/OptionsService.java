package com.etsong.personality.service;

import java.util.List;
import com.etsong.personality.domain.Options;

/**
 * 选项管理Service接口
 * 
 * @author ruoyi
 * @date 2025-07-11
 */
public interface OptionsService
{
    /**
     * 查询选项管理
     * 
     * @param optionId 选项管理主键
     * @return 选项管理
     */
    public Options selectPersonalityOptionsByOptionId(Long optionId);

    /**
     * 查询选项管理列表
     * 
     * @param options 选项管理
     * @return 选项管理集合
     */
    public List<Options> selectPersonalityOptionsList(Options options);

    /**
     * 新增选项管理
     * 
     * @param options 选项管理
     * @return 结果
     */
    public int insertPersonalityOptions(Options options);

    /**
     * 修改选项管理
     * 
     * @param options 选项管理
     * @return 结果
     */
    public int updatePersonalityOptions(Options options);

    /**
     * 批量删除选项管理
     * 
     * @param optionIds 需要删除的选项管理主键集合
     * @return 结果
     */
    public int deletePersonalityOptionsByOptionIds(Long[] optionIds);

    /**
     * 删除选项管理信息
     * 
     * @param optionId 选项管理主键
     * @return 结果
     */
    public int deletePersonalityOptionsByOptionId(Long optionId);
}
