package com.yueheng.studentHall.service;

import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.StudyRoom;

public interface StudyRoomService {
    ResponseResult getStudyRoom();
    ResponseResult getStudyRoomOnlyType();
    ResponseResult createStudyRoom(StudyRoom studyRoom);
    ResponseResult updateStudyRoom(StudyRoom studyRoom,boolean isEdict);
    ResponseResult deleteStudyRoom(int studyRoomId);
    // 其他自定义方法
}