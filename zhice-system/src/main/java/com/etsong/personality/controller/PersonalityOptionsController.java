// QuestionController.java
package com.etsong.personality.controller;

import com.etsong.common.core.controller.BaseController;
import com.etsong.common.core.page.TableDataInfo;
import com.etsong.personality.domain.PersonalityOptionsVO;
import com.etsong.personality.service.IPersonalityOptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 题目相关控制器
 */
@RestController
@RequestMapping("/personality/options")
public class PersonalityOptionsController extends BaseController {

    @Autowired
    private IPersonalityOptionsService personalityOptionsService;

    /**
     * 查询题目管理列表
     */
    @PreAuthorize("@ss.hasPermi('personality:options:list')")
    @GetMapping("/list")
    public TableDataInfo list()
    {
//        startPage();
        List<PersonalityOptionsVO> list = personalityOptionsService.selectPersonalityOptionsList();
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('personality:options:list')")
    @GetMapping("/selectOptionDefinition")
    public TableDataInfo listOptionDefinition()
    {
//        startPage();
        List<PersonalityOptionsVO> list = personalityOptionsService.selectOptionDefinitionList();
        return getDataTable(list);
    }


}
