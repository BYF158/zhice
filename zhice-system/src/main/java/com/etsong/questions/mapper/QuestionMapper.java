package com.etsong.questions.mapper;

import com.etsong.questions.domain.Topic;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;
import java.util.List;

@Mapper
public interface QuestionMapper {


    List<Topic> selectPage(RowBounds rowBounds);
    

    int countAll();
}