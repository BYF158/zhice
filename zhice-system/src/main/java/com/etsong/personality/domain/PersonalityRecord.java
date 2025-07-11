package com.etsong.personality.domain;


import lombok.Data;

import java.util.Date;

@Data

public class PersonalityRecord {


    private Long recordId;
    private Long userId;
    private Date testTime;
}
