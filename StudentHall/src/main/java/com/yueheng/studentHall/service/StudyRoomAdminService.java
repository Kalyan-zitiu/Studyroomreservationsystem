package com.yueheng.studentHall.service;

import com.yueheng.studentHall.pojo.StudyRoomAdmin;

public interface StudyRoomAdminService {
    StudyRoomAdmin getStudyRoomAdminById(int adminId);
    void createStudyRoomAdmin(StudyRoomAdmin studyRoomAdmin);
    void updateStudyRoomAdmin(StudyRoomAdmin studyRoomAdmin);
    void deleteStudyRoomAdmin(int adminId);
    // 其他自定义方法
}