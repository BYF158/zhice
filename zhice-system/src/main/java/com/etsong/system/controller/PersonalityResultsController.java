package com.etsong.system.controller;

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
import com.etsong.system.domain.PersonalityResult;
import com.etsong.system.service.IPersonalityResultsService;
import com.etsong.common.utils.poi.ExcelUtil;
import com.etsong.common.core.page.TableDataInfo;

/**
 * 得分管理Controller
 * 
 * @author ruoyi
 * @date 2025-07-10
 */
@RestController
@RequestMapping("/personality/personality")
public class PersonalityResultsController extends BaseController
{
    @Autowired
    private IPersonalityResultsService personalityResultsService;

    /**
     * 查询得分管理列表
     */
    @PreAuthorize("@ss.hasPermi('personality:personality:list')")
    @GetMapping("/list")
    public TableDataInfo list(PersonalityResult personalityResult)
    {
        startPage();
        List<PersonalityResult> list = personalityResultsService.selectPersonalityResultsList(personalityResult);
        return getDataTable(list);
    }

    /**
     * 导出得分管理列表
     */
    @PreAuthorize("@ss.hasPermi('personality:personality:export')")
    @Log(title = "得分管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PersonalityResult personalityResult)
    {
        List<PersonalityResult> list = personalityResultsService.selectPersonalityResultsList(personalityResult);
        ExcelUtil<PersonalityResult> util = new ExcelUtil<PersonalityResult>(PersonalityResult.class);
        util.exportExcel(response, list, "得分管理数据");
    }

    /**
     * 获取得分管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('personality:personality:query')")
    @GetMapping(value = "/{resultId}")
    public AjaxResult getInfo(@PathVariable("resultId") Long resultId)
    {
        return success(personalityResultsService.selectPersonalityResultsByResultId(resultId));
    }

    /**
     * 新增得分管理
     */
    @PreAuthorize("@ss.hasPermi('personality:personality:add')")
    @Log(title = "得分管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PersonalityResult personalityResult)
    {
        return toAjax(personalityResultsService.insertPersonalityResults(personalityResult));
    }

    /**
     * 修改得分管理
     */
    @PreAuthorize("@ss.hasPermi('personality:personality:edit')")
    @Log(title = "得分管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PersonalityResult personalityResult)
    {
        return toAjax(personalityResultsService.updatePersonalityResults(personalityResult));
    }

    /**
     * 删除得分管理
     */
    @PreAuthorize("@ss.hasPermi('personality:personality:remove')")
    @Log(title = "得分管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{resultIds}")
    public AjaxResult remove(@PathVariable Long[] resultIds)
    {
        return toAjax(personalityResultsService.deletePersonalityResultsByResultIds(resultIds));
    }
}
