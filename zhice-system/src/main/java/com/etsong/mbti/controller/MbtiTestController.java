package com.etsong.mbti.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.etsong.common.annotation.Anonymous;
import com.etsong.common.core.controller.BaseController;
import com.etsong.common.core.domain.AjaxResult;
import com.etsong.common.core.domain.model.LoginUser;
import com.etsong.common.utils.SecurityUtils;
import com.etsong.mbti.domain.MbtiQuestion;
import com.etsong.mbti.domain.MbtiRecord;
import com.etsong.mbti.domain.MbtiResultVO;
import com.etsong.mbti.domain.MbtiSubmitRequest;
import com.etsong.mbti.service.IMbtiTestService;

/**
 * MBTI 测试 Controller（答题 / 提交 / 结果）
 *
 * @author openclaw
 * @date 2026-10-21
 */
@RestController
@RequestMapping("/mbti")
public class MbtiTestController extends BaseController
{
    @Autowired
    private IMbtiTestService mbtiTestService;

    /**
     * 获取题库（匿名可访问）
     */
    @Anonymous
    @GetMapping("/questions")
    public AjaxResult questions()
    {
        List<MbtiQuestion> list = mbtiTestService.selectQuestionList();
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data", list);
        ajax.put("total", list.size());
        return ajax;
    }

    /**
     * 提交答卷并返回测试结果（匿名可访问）
     */
    @Anonymous
    @PostMapping("/submit")
    public AjaxResult submit(@RequestBody MbtiSubmitRequest request)
    {
        Long userId = null;
        String loginName = null;
        try
        {
            LoginUser loginUser = SecurityUtils.getLoginUser();
            if (loginUser != null)
            {
                userId = loginUser.getUserId();
                loginName = loginUser.getUsername();
            }
        }
        catch (Exception ignored)
        {
            // 匿名访问时没有登录信息，使用答卷中的昵称
        }
        MbtiResultVO result = mbtiTestService.submit(request, userId, loginName);
        return AjaxResult.success("提交成功", result);
    }

    /**
     * 查询指定记录的结果（匿名可访问，便于分享结果页）
     */
    @Anonymous
    @GetMapping("/result/{recordId}")
    public AjaxResult result(@PathVariable Long recordId)
    {
        return AjaxResult.success(mbtiTestService.selectResultById(recordId));
    }

    /**
     * 查询当前登录用户的测试记录
     */
    @GetMapping("/myRecords")
    public AjaxResult myRecords()
    {
        MbtiRecord query = new MbtiRecord();
        try
        {
            query.setUserId(SecurityUtils.getUserId());
        }
        catch (Exception e)
        {
            return AjaxResult.error("请先登录");
        }
        List<MbtiRecord> list = mbtiTestService.selectRecordList(query);
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("data", list);
        data.put("total", list.size());
        return AjaxResult.success(data);
    }
}
