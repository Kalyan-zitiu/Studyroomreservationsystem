package com.yueheng.studentHall.controller;

import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.StudyRoom;
import com.yueheng.studentHall.service.StudyRoomService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/study-rooms")
public class StudyRoomController {
    private final StudyRoomService studyRoomService;

    public StudyRoomController(StudyRoomService studyRoomService) {
        this.studyRoomService = studyRoomService;
    }

    /**
     * 获取所有的自习室
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_room')")
    @GetMapping("/")
    public ResponseResult getStudyRoom() {
       return studyRoomService.getStudyRoom();
    }

    /**
     * 获取所有的自习室类型（only）
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_room','study_cancel')")
    @GetMapping("getStudyRoomOnlyType")
    public ResponseResult getStudyRoomOnlyType() {
        return studyRoomService.getStudyRoomOnlyType();
    }

    /**
     * 创建自习室
     * @param studyRoom
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_room')")
    @PostMapping
    public ResponseResult createStudyRoom(@RequestBody StudyRoom studyRoom) {
        return studyRoomService.createStudyRoom(studyRoom);
    }

    /**
     * 修改自习室
     * @param studyRoom
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_room')")
    @PutMapping("")
    public ResponseResult updateStudyRoom(@RequestBody StudyRoom studyRoom,@RequestParam boolean isEdict) {
        return studyRoomService.updateStudyRoom(studyRoom,isEdict);
    }

    /**
     * 删除自习室
     * @param studyRoomId
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_room')")
    @DeleteMapping("/{studyRoomId}")
    public ResponseResult deleteStudyRoom(@PathVariable String studyRoomId) {
        System.out.println(studyRoomId+"----------");
        int id = Integer.parseInt(studyRoomId);
        return studyRoomService.deleteStudyRoom(id);
    }
    // 其他自定义方法的映射
}