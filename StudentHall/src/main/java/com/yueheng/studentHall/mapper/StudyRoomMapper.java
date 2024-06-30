package com.yueheng.studentHall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yueheng.studentHall.pojo.StudyRoom;
import com.yueheng.studentHall.pojo.dto.TypeDTO;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface StudyRoomMapper extends BaseMapper<StudyRoom> {
    @Select("SELECT * FROM study_room")
    List<StudyRoom> getStudyRoom();

    @Select("SELECT type FROM study_room")
    List<TypeDTO> getStudyRoomOnlyType();

    @Insert("INSERT INTO study_room " +
            "(study_room_number, capacity,facilities,type) " +
            "VALUES (#{studyRoomNumber}, #{capacity}, #{facilities}, #{type})")
    void createStudyRoom(StudyRoom studyRoom);

    @Update("UPDATE study_room SET type = #{type}, capacity = #{capacity}," +
            " study_room_number = #{studyRoomNumber}, facilities = #{facilities} " +
            "WHERE study_room_id = #{studyRoomId}")
    void updateStudyRoom(StudyRoom studyRoom);

    @Delete("DELETE FROM study_room WHERE study_room_id = #{studyRoomId}")
    void deleteStudyRoom(int studyRoomId);
}