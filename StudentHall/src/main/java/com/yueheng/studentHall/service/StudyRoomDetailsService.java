package com.yueheng.studentHall.service;

import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.StudyRoomDetails;

import java.util.List;

public interface StudyRoomDetailsService {
    ResponseResult getDetailsById(int id);

    ResponseResult getAllDetails(String keyword);

    ResponseResult createDetails(StudyRoomDetails details);

    ResponseResult updateDetails(StudyRoomDetails details);

    ResponseResult deleteDetails(int id);

    ResponseResult getTable();
}