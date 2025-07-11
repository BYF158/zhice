package com.etsong.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.etsong.system.mapper.PersonalityResultsMapper;
import com.etsong.system.domain.PersonalityResult;
import com.etsong.system.service.IPersonalityResultsService;
import com.etsong.system.mapper.SysUserMapper;
import com.etsong.common.core.domain.entity.SysUser;


/**
 * 得分管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-07-10
 */
@Service
public class PersonalityResultsServiceImpl implements IPersonalityResultsService 
{
    @Autowired
    private PersonalityResultsMapper personalityResultsMapper;

    @Autowired
    private SysUserMapper userMapper;

    /**
     * 查询得分管理
     * 
     * @param resultId 得分管理主键
     * @return 得分管理
     */
    @Override
    public PersonalityResult selectPersonalityResultsByResultId(Long resultId)
    {
        return personalityResultsMapper.selectPersonalityResultsByResultId(resultId);
    }

    /**
     * 查询得分管理列表
     * 
     * @param personalityResult 得分管理
     * @return 得分管理
     */
    @Override
    public List<PersonalityResult> selectPersonalityResultsList(PersonalityResult personalityResult)
    {
        // 根据用户ID添加用户名
        List<PersonalityResult> listResult = personalityResultsMapper.selectPersonalityResultsList(personalityResult);
        for (PersonalityResult result : listResult) {
            String userId = result.getUserId().toString();
            String userName = userMapper.selectUserNameById(Long.valueOf(userId));
            if (userName != null) {
                result.setUserName(userName);
            }
        }
        return listResult;
    }

    /**
     * 新增得分管理
     * 
     * @param personalityResult 得分管理
     * @return 结果
     */
    @Override
    public int insertPersonalityResults(PersonalityResult personalityResult)
    {
        return personalityResultsMapper.insertPersonalityResults(personalityResult);
    }

    /**
     * 修改得分管理
     * 
     * @param personalityResult 得分管理
     * @return 结果
     */
    @Override
    public int updatePersonalityResults(PersonalityResult personalityResult)
    {
        return personalityResultsMapper.updatePersonalityResults(personalityResult);
    }

    /**
     * 批量删除得分管理
     * 
     * @param resultIds 需要删除的得分管理主键
     * @return 结果
     */
    @Override
    public int deletePersonalityResultsByResultIds(Long[] resultIds)
    {
        return personalityResultsMapper.deletePersonalityResultsByResultIds(resultIds);
    }

    /**
     * 删除得分管理信息
     * 
     * @param resultId 得分管理主键
     * @return 结果
     */
    @Override
    public int deletePersonalityResultsByResultId(Long resultId)
    {
        return personalityResultsMapper.deletePersonalityResultsByResultId(resultId);
    }
}
