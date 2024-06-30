package com.yueheng.studentHall.service.impl;

import com.yueheng.studentHall.mapper.StudyRoomAdminMapper;
import com.yueheng.studentHall.pojo.StudyRoomAdmin;
import com.yueheng.studentHall.service.StudyRoomAdminService;
import org.springframework.stereotype.Service;

@Service
public class StudyRoomAdminServiceImpl implements StudyRoomAdminService {
    private final StudyRoomAdminMapper studyRoomAdminMapper;

    public StudyRoomAdminServiceImpl(StudyRoomAdminMapper studyRoomAdminMapper) {
        this.studyRoomAdminMapper= studyRoomAdminMapper;
    }

    @Override
    public StudyRoomAdmin getStudyRoomAdminById(int adminId) {
        return studyRoomAdminMapper.getStudyRoomAdminById(adminId);
    }

    @Override
    public void createStudyRoomAdmin(StudyRoomAdmin studyRoomAdmin) {
        studyRoomAdminMapper.createStudyRoomAdmin(studyRoomAdmin);
    }

    @Override
    public void updateStudyRoomAdmin(StudyRoomAdmin studyRoomAdmin) {
        studyRoomAdminMapper.updateStudyRoomAdmin(studyRoomAdmin);
    }

    @Override
    public void deleteStudyRoomAdmin(int adminId) {
        studyRoomAdminMapper.deleteStudyRoomAdmin(adminId);
    }
    // 实现其他自定义方法
}