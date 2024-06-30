package com.yueheng.studentHall.controller;

import com.yueheng.studentHall.pojo.StudyRoomAdmin;
import com.yueheng.studentHall.service.StudyRoomAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/study-room-admins")
public class StudyRoomAdminController___ {
    private final StudyRoomAdminService studyRoomAdminService;

    @Autowired
    public StudyRoomAdminController___(StudyRoomAdminService studyRoomAdminService) {
        this.studyRoomAdminService = studyRoomAdminService;
    }

    /**
     *
     * @param adminId
     * @return
     */
    @GetMapping("/{adminId}")
    public StudyRoomAdmin getStudyRoomAdminById(@PathVariable int adminId) {
        return studyRoomAdminService.getStudyRoomAdminById(adminId);
    }

    @PostMapping
    public void createStudyRoomAdmin(@RequestBody StudyRoomAdmin studyRoomAdmin) {
        studyRoomAdminService.createStudyRoomAdmin(studyRoomAdmin);
    }

    @PutMapping("/{adminId}")
    public void updateStudyRoomAdmin(@PathVariable int adminId, @RequestBody StudyRoomAdmin studyRoomAdmin) {
        studyRoomAdmin.setAdminId(adminId);
        studyRoomAdminService.updateStudyRoomAdmin(studyRoomAdmin);
    }

    @DeleteMapping("/{adminId}")
    public void deleteStudyRoomAdmin(@PathVariable int adminId) {
        studyRoomAdminService.deleteStudyRoomAdmin(adminId);
    }
}