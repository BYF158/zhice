package com.etsong.web.controller.system;

import com.etsong.common.annotation.Log;
import com.etsong.common.core.controller.BaseController;
import com.etsong.common.core.domain.AjaxResult;
import com.etsong.common.core.domain.entity.PrototypeScoreDTO;
import com.etsong.common.core.domain.entity.PrototypeScoreVO;
import com.etsong.common.core.domain.entity.SysUser;
import com.etsong.common.core.page.TableDataInfo;
import com.etsong.common.enums.BusinessType;
import com.etsong.common.utils.ResultTransformer;
import com.etsong.system.service.ISysTestRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 角色信息
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/questions/testrecord")
public class SysTestRecordController extends BaseController
{
    @Autowired
    private ISysTestRecordService testRecordService;


//    @PreAuthorize("@ss.hasPermi('topic:score:remove')")
    @Log(title = "得分管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{recordIds}")
    public AjaxResult remove(@PathVariable Long[] recordIds)
    {
        return toAjax(testRecordService.deleteTestRecordByIds(recordIds));
    }


}
