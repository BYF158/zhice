package com.etsong.questions.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.etsong.common.annotation.Log;
import com.etsong.common.core.controller.BaseController;
import com.etsong.common.core.domain.AjaxResult;
import com.etsong.common.enums.BusinessType;
import com.etsong.questions.domain.Topic;
import com.etsong.questions.service.ITopicService;
import com.etsong.common.utils.poi.ExcelUtil;
import com.etsong.common.core.page.TableDataInfo;

/**
 * 题目管理Controller
 * 
 * @author ruoyi
 * @date 2025-07-01
 */
@RestController
@RequestMapping("/questions/topic")
public class TopicController extends BaseController
{
    @Autowired
    private ITopicService topicService;

    /**
     * 查询题目管理列表
     */
    @PreAuthorize("@ss.hasPermi('questions:topic:list')")
    @GetMapping("/list")
    public TableDataInfo list(Topic topic)
    {
        startPage();
        List<Topic> list = topicService.selectTopicList(topic);
        return getDataTable(list);
    }

    /**
     * 导出题目管理列表
     */
    @PreAuthorize("@ss.hasPermi('questions:topic:export')")
    @Log(title = "题目管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Topic topic)
    {
        List<Topic> list = topicService.selectTopicList(topic);
        ExcelUtil<Topic> util = new ExcelUtil<Topic>(Topic.class);
        util.exportExcel(response, list, "题目管理数据");
    }

    /**
     * 获取题目管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('questions:topic:query')")
    @GetMapping(value = "/{topicId}")
    public AjaxResult getInfo(@PathVariable("topicId") Long topicId)
    {
        return success(topicService.selectTopicByTopicId(topicId));
    }

    /**
     * 新增题目管理
     */
    @PreAuthorize("@ss.hasPermi('questions:topic:add')")
    @Log(title = "题目管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Topic topic)
    {
        return toAjax(topicService.insertTopic(topic));
    }

    /**
     * 修改题目管理
     */
    @PreAuthorize("@ss.hasPermi('questions:topic:edit')")
    @Log(title = "题目管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Topic topic)
    {
        return toAjax(topicService.updateTopic(topic));
    }

    /**
     * 删除题目管理
     */
    @PreAuthorize("@ss.hasPermi('questions:topic:remove')")
    @Log(title = "题目管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{topicIds}")
    public AjaxResult remove(@PathVariable Long[] topicIds)
    {
        return toAjax(topicService.deleteTopicByTopicIds(topicIds));
    }
}
