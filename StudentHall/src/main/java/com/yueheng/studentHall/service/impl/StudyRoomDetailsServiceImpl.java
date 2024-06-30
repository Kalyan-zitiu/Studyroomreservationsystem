package com.yueheng.studentHall.service.impl;

import com.yueheng.studentHall.mapper.StudyRoomDetailsMapper;
import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.StudyRoomDetails;
import com.yueheng.studentHall.pojo.dto.StudyRoomDetailsDTO;
import com.yueheng.studentHall.service.StudyRoomDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudyRoomDetailsServiceImpl implements StudyRoomDetailsService {
    private final StudyRoomDetailsMapper detailsMapper;

    @Autowired
    public StudyRoomDetailsServiceImpl(StudyRoomDetailsMapper detailsMapper) {
        this.detailsMapper = detailsMapper;
    }

    @Override
    public ResponseResult getDetailsById(int id) {
        StudyRoomDetails detailsById = detailsMapper.getDetailsById(id);
        return new ResponseResult(200,detailsById);
    }

    @Override
    public ResponseResult getAllDetails(String type) {
        List<StudyRoomDetailsDTO> allDetails = detailsMapper.getAllDetails(type);
        return new ResponseResult(200,allDetails);
    }

    @Override
    public ResponseResult createDetails(StudyRoomDetails details) {
        detailsMapper.createDetails(details);
        return new ResponseResult(200,"创建成功！");
    }

    @Override
    public ResponseResult updateDetails(StudyRoomDetails details) {
        detailsMapper.updateDetails(details);
        return new ResponseResult(200,"修改成功！");
    }

    @Override
    public ResponseResult deleteDetails(int id) {
        detailsMapper.deleteDetails(id);
        return new ResponseResult(200,"删除成功！");
    }

    @Override
    public ResponseResult getTable() {
        // 1.获取所有教室的详细信息
        List<StudyRoomDetailsDTO> table = detailsMapper.getTable();
        // 2.计算教室的使用率
        for (int i = 0; i < table.size(); i++) {
            StudyRoomDetailsDTO studyRoomDetailsDTO = table.get(i);
            float v;
            if (studyRoomDetailsDTO.getReservationFrequency() == 0){
                v = 0;
            }else{
                v = (float) studyRoomDetailsDTO.getUsageFrequency()
                        / studyRoomDetailsDTO.getReservationFrequency();
            }
            studyRoomDetailsDTO.setUsagePercent(v);
        }
        // 3.返回
        return new ResponseResult(200,table);
    }
}