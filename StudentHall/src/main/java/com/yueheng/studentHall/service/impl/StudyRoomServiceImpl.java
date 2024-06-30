package com.yueheng.studentHall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yueheng.studentHall.mapper.StudyRoomMapper;
import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.StudyRoom;
import com.yueheng.studentHall.pojo.dto.TypeDTO;
import com.yueheng.studentHall.service.StudyRoomService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudyRoomServiceImpl implements StudyRoomService {
    private final StudyRoomMapper studyRoomMapper;

    public StudyRoomServiceImpl(StudyRoomMapper studyRoomMapper) {
        this.studyRoomMapper = studyRoomMapper;
    }

    @Override
    public ResponseResult getStudyRoom() {
        List<StudyRoom> studyRoomById = studyRoomMapper.getStudyRoom();
        return new ResponseResult(200,studyRoomById);
    }

    @Override
    public ResponseResult getStudyRoomOnlyType() {
        List<TypeDTO> typeDTOS = studyRoomMapper.getStudyRoomOnlyType();
        return new ResponseResult(200,typeDTOS);
    }

    @Override
    public ResponseResult createStudyRoom(StudyRoom studyRoom) {
        studyRoomMapper.createStudyRoom(studyRoom);
        return new ResponseResult(200,"创建成功！");
    }

    @Override
    public ResponseResult updateStudyRoom(StudyRoom studyRoom,boolean isEdict) {
        // 1.判断是编辑还是保存
        if (isEdict){
            // 编辑
            studyRoomMapper.updateStudyRoom(studyRoom);
            return new ResponseResult(200,"修改成功！");
        }else {
            // 保存，不是编辑
            // 2.查询自习室类型是否重复
            StudyRoom study = studyRoomMapper.selectOne(
                    new QueryWrapper<StudyRoom>().eq("type", studyRoom.getType()));
            if (study != null){
                // 重复，则报错
                return new ResponseResult(777,"自习室类型重复！");
            }else {
                // 不重复，则保存
                studyRoomMapper.insert(studyRoom);
                return new ResponseResult(200,"保存成功！");
            }
        }
    }

    @Override
    public ResponseResult deleteStudyRoom(int studyRoomId) {
        studyRoomMapper.deleteStudyRoom(studyRoomId);
        return new ResponseResult(200,"删除成功！");
    }
    // 实现其他自定义方法
}