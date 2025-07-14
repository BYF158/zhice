package com.etsong.personality.controller;

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
import com.etsong.personality.domain.Options;
import com.etsong.personality.service.OptionsService;
import com.etsong.common.utils.poi.ExcelUtil;
import com.etsong.common.core.page.TableDataInfo;

/**
 * 选项管理Controller
 * 
 * @author ruoyi
 * @date 2025-07-11
 */
@RestController
@RequestMapping("/options/options")
public class OptionsController extends BaseController
{
    @Autowired
    private OptionsService personalityOptionsService;

    /**
     * 查询选项管理列表
     */

    @GetMapping("/list")
    public TableDataInfo list(Options options)
    {
        startPage();
        List<Options> list = personalityOptionsService.selectPersonalityOptionsList(options);
        return getDataTable(list);
    }

    /**
     * 导出选项管理列表
     */
    @PreAuthorize("@ss.hasPermi('options:options:export')")
    @Log(title = "选项管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Options options)
    {
        List<Options> list = personalityOptionsService.selectPersonalityOptionsList(options);
        ExcelUtil<Options> util = new ExcelUtil<Options>(Options.class);
        util.exportExcel(response, list, "选项管理数据");
    }

    /**
     * 获取选项管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('options:options:query')")
    @GetMapping(value = "/{optionId}")
    public AjaxResult getInfo(@PathVariable("optionId") Long optionId)
    {
        return success(personalityOptionsService.selectPersonalityOptionsByOptionId(optionId));
    }

    /**
     * 新增选项管理
     */
    @PreAuthorize("@ss.hasPermi('options:options:add')")
    @Log(title = "选项管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Options options)
    {
        return toAjax(personalityOptionsService.insertPersonalityOptions(options));
    }

    /**
     * 修改选项管理
     */
    @PreAuthorize("@ss.hasPermi('options:options:edit')")
    @Log(title = "选项管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Options options)
    {
        return toAjax(personalityOptionsService.updatePersonalityOptions(options));
    }

    /**
     * 删除选项管理
     */
    @PreAuthorize("@ss.hasPermi('options:options:remove')")
    @Log(title = "选项管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{optionIds}")
    public AjaxResult remove(@PathVariable Long[] optionIds)
    {
        return toAjax(personalityOptionsService.deletePersonalityOptionsByOptionIds(optionIds));
    }
}
