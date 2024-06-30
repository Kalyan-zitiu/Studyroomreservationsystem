package com.yueheng.studentHall.controller;

import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.StudyRoomDetails;
import com.yueheng.studentHall.service.StudyRoomDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/study-room-details")
public class StudyRoomDetailsController {
    @Autowired
    private StudyRoomDetailsService detailsService;

    @GetMapping("/{id}")
    public ResponseResult getDetailsById(@PathVariable int id) {
        return detailsService.getDetailsById(id);
    }

    /**
     * 获取特定的自习室
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_cancel')")
    @GetMapping("/getAllDetails")
    public ResponseResult getAllDetails(@RequestParam("key") String key) {
        return detailsService.getAllDetails(key);
    }

    /**
     * 自习室的统计报表
     * @return
     */
    @PreAuthorize("hasAnyAuthority('usage_rate')")
    @GetMapping("/getTable")
    public ResponseResult getTable() {
        return detailsService.getTable();
    }

    /**
     * 创建教室
     * @param details
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_cancel')")
    @PostMapping("/create")
    public ResponseResult createDetails(@RequestBody StudyRoomDetails details) {
        return detailsService.createDetails(details);
    }

    @PutMapping("/update")
    public ResponseResult updateDetails(@RequestBody StudyRoomDetails details) {
        return detailsService.updateDetails(details);
    }

    @DeleteMapping("/{id}")
    public ResponseResult deleteDetails(@PathVariable int id) {
        return detailsService.deleteDetails(id);
    }
}