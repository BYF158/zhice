package com.etsong.questions.service.impl;

import com.etsong.common.core.domain.R;
import com.etsong.questions.domain.Topic;
import com.etsong.questions.service.QuestionService;
import com.github.pagehelper.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.etsong.questions.mapper.QuestionMapper;

import java.util.List;
import org.apache.ibatis.session.RowBounds;


@Service
public class QuestionServiceImpl implements QuestionService {

    private static final Logger log = LoggerFactory.getLogger(QuestionServiceImpl.class);
    @Autowired
    private QuestionMapper questionMapper;

    /**
     * 分页获取问题列表
     *
     * @param pageNum  当前页码
     * @param pageSize 每页大小，默认为6
     * @return 分页结果
     */
    @Override
    public R<Page<Topic>> getQuestionByPage(Integer pageNum, Integer pageSize) {
        int page = (pageNum != null && pageNum > 0) ? pageNum : 1;
        int size = (pageSize != null && pageSize > 0) ? pageSize : 6;

        // 使用MyBatis的RowBounds进行分页
        int offset = (page - 1) * size;
        RowBounds rowBounds = new RowBounds(offset, size);
        List<Topic> topics = questionMapper.selectPage(rowBounds);
        
        // 创建Page对象并设置总记录数
        Page<Topic> pageObj = new Page<>(page, size);
        pageObj.addAll(topics);

        // 查询总记录数
        int totalCount = questionMapper.countAll();
        pageObj.setTotal(totalCount);

        log.info("分页查询结果：{}", pageObj);
        
        // 返回封装后的结果
        return R.ok(pageObj);
    }
}