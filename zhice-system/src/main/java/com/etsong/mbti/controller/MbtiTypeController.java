package com.etsong.mbti.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.etsong.common.annotation.Anonymous;
import com.etsong.common.core.controller.BaseController;
import com.etsong.common.core.domain.AjaxResult;
import com.etsong.mbti.domain.MbtiType;
import com.etsong.mbti.service.IMbtiTypeService;

/**
 * MBTI 十六型人格 Controller
 *
 * @author openclaw
 * @date 2026-10-21
 */
@RestController
@RequestMapping("/mbti/type")
public class MbtiTypeController extends BaseController
{
    @Autowired
    private IMbtiTypeService mbtiTypeService;

    @Anonymous
    @GetMapping("/list")
    public AjaxResult list(MbtiType query)
    {
        List<MbtiType> list = mbtiTypeService.selectTypeList(query);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("data", list);
        ajax.put("total", list.size());
        return ajax;
    }

    @Anonymous
    @GetMapping("/{typeCode}")
    public AjaxResult detail(@PathVariable String typeCode)
    {
        return AjaxResult.success(mbtiTypeService.selectTypeByCode(typeCode));
    }
}
