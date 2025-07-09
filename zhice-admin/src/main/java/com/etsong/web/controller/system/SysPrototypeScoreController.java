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
import com.etsong.system.service.ISysPrototypeScoreService;
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
@RequestMapping("/questions/prototype")
public class SysPrototypeScoreController extends BaseController
{
    @Autowired
    private ISysPrototypeScoreService prototypeScoreService;


//    @PreAuthorize("@ss.hasPermi('questions:score:search')")
//    @GetMapping("/list")
//    public TableDataInfo list()
//    {
//        startPage();
//        List<PrototypeScoreDTO> list = prototypeScoreService.selectScoreDetails();
//        return getDataTable(list);
//    }
//
//    /**查询全部-不限制时间
//     * 查询
//     * @param sysUser
//     * @return
//     */
//    @GetMapping( "/search0")
//    public TableDataInfo getInfo0( SysUser sysUser)
//    {
//        System.out.println("sysuser====="+sysUser.toString());
//        startPage();
//        List<PrototypeScoreDTO> prototypeScoreDTOS = prototypeScoreService.selectScoreDetailsByCondition2(sysUser);
//        return getDataTable(prototypeScoreDTOS);
//    }
//
//    //    @PreAuthorize("@ss.hasPermi('questions:score:username')")
//    @GetMapping(value = "/{userName}")
//    public AjaxResult getInfo(@PathVariable String userName)
//    {
//        Map<String, Object> params = new HashMap<>();
//        params.put("userName", userName);
//        List<PrototypeScoreDTO> prototypeScoreDTOS = prototypeScoreService.selectScoreDetailsByCondition(params);
//        return success(prototypeScoreDTOS);
//    }




    /**
     * 查询全部12类--插入数据时注意时间的唯一性
     * @param sysUser
     * @return
     */
    @PreAuthorize("@ss.hasPermi('questions:score:list')")
    @GetMapping( "/search")
    public TableDataInfo getInfo( SysUser sysUser)
    {
        System.out.println("sysuser====="+sysUser.toString());
//        startPage();
        List<PrototypeScoreDTO> prototypeScoreDTOS = prototypeScoreService.selectScoreDetailsByCondition2(sysUser);
        List<PrototypeScoreVO> transform = ResultTransformer.transform(prototypeScoreDTOS);
        return getDataTable(transform);
    }

    /**
     * 删除记录
     * @param recordIds
     * @return
     */
    @PreAuthorize("@ss.hasPermi('questions:score:remove')")
    @DeleteMapping("/{recordIds}")
    public AjaxResult remove(@PathVariable Long[] recordIds)
    {

        return toAjax(prototypeScoreService.deletePrototypeScoreByIds(recordIds));
    }

    /**
     * 查最新一组记录
     * @param sysUser
     * @return
     */
    @PreAuthorize("@ss.hasPermi('questions:score2:list')")
    @GetMapping( "/search1")
    public TableDataInfo getInfo1( PrototypeScoreDTO sysUser)
    {
        System.out.println("sysuser====="+sysUser.toString());
        startPage();
        List<PrototypeScoreDTO> prototypeScoreDTOS = prototypeScoreService.selectScoreDetailsByCondition3(sysUser);
        return getDataTable(prototypeScoreDTOS);
    }

}
