package com.yueheng.studentHall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yueheng.studentHall.pojo.StudyRoomDetails;
import com.yueheng.studentHall.pojo.dto.StudyRoomDetailsDTO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface StudyRoomDetailsMapper extends BaseMapper<StudyRoomDetails> {
    @Select("SELECT * FROM study_room_details WHERE id = #{id}")
    StudyRoomDetails getDetailsById(int id);

    @Select("SELECT sr.capacity, sr.facilities, sr.study_room_number, sr.type, srd.location\n" +
            "FROM study_room_details\n" +
            "    as srd\n" +
            "join study_room as sr\n" +
            "where srd.study_room_id = sr.study_room_id and type = #{type};")
    List<StudyRoomDetailsDTO> getAllDetails(String type);

    @Insert("INSERT INTO study_room_details (location, study_room_id) VALUES (#{location}, #{studyRoomId})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void createDetails(StudyRoomDetails details);

    @Update("UPDATE study_room_details SET location = #{location}, study_room_id = #{studyRoomId} WHERE id = #{id}")
    void updateDetails(StudyRoomDetails details);

    @Delete("DELETE FROM study_room_details WHERE id = #{id}")
    void deleteDetails(int id);

    @Select("SELECT * FROM study_room_details")
    List<StudyRoomDetailsDTO> getTable();
}