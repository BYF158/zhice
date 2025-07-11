package com.etsong.system.mapper;

import java.util.List;
import com.etsong.system.domain.PersonalityResult;

/**
 * 得分管理Mapper接口
 * 
 * @author ruoyi
 * @date 2025-07-10
 */
public interface PersonalityResultsMapper 
{
    /**
     * 查询得分管理
     * 
     * @param resultId 得分管理主键
     * @return 得分管理
     */
    public PersonalityResult selectPersonalityResultsByResultId(Long resultId);

    /**
     * 查询得分管理列表
     * 
     * @param personalityResult 得分管理
     * @return 得分管理集合
     */
    public List<PersonalityResult> selectPersonalityResultsList(PersonalityResult personalityResult);

    /**
     * 新增得分管理
     * 
     * @param personalityResult 得分管理
     * @return 结果
     */
    public int insertPersonalityResults(PersonalityResult personalityResult);

    /**
     * 修改得分管理
     * 
     * @param personalityResult 得分管理
     * @return 结果
     */
    public int updatePersonalityResults(PersonalityResult personalityResult);

    /**
     * 删除得分管理
     * 
     * @param resultId 得分管理主键
     * @return 结果
     */
    public int deletePersonalityResultsByResultId(Long resultId);

    /**
     * 批量删除得分管理
     * 
     * @param resultIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePersonalityResultsByResultIds(Long[] resultIds);
}
