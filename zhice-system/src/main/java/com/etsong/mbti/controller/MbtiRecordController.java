package com.etsong.mbti.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.etsong.common.annotation.Log;
import com.etsong.common.core.controller.BaseController;
import com.etsong.common.core.domain.AjaxResult;
import com.etsong.common.core.page.TableDataInfo;
import com.etsong.common.enums.BusinessType;
import com.etsong.common.utils.poi.ExcelUtil;
import com.etsong.mbti.domain.MbtiRecord;
import com.etsong.mbti.service.IMbtiTestService;

/**
 * MBTI 测试记录 Controller（管理端）
 *
 * @author openclaw
 * @date 2026-10-21
 */
@RestController
@RequestMapping("/mbti/record")
public class MbtiRecordController extends BaseController
{
    @Autowired
    private IMbtiTestService mbtiTestService;

    @PreAuthorize("@ss.hasPermi('mbti:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(MbtiRecord query)
    {
        startPage();
        List<MbtiRecord> list = mbtiTestService.selectRecordList(query);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('mbti:record:export')")
    @Log(title = "MBTI测试记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MbtiRecord query)
    {
        List<MbtiRecord> list = mbtiTestService.selectRecordList(query);
        ExcelUtil<MbtiRecord> util = new ExcelUtil<MbtiRecord>(MbtiRecord.class);
        util.exportExcel(response, list, "MBTI测试记录");
    }

    @PreAuthorize("@ss.hasPermi('mbti:record:remove')")
    @Log(title = "MBTI测试记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{recordIds}")
    public AjaxResult remove(@PathVariable Long[] recordIds)
    {
        return toAjax(mbtiTestService.deleteRecordByIds(recordIds));
    }
}
