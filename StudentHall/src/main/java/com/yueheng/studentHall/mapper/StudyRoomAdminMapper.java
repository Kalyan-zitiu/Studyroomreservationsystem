package com.yueheng.studentHall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yueheng.studentHall.pojo.StudyRoomAdmin;
import org.apache.ibatis.annotations.*;

@Mapper
public interface StudyRoomAdminMapper extends BaseMapper<StudyRoomAdmin> {
    @Select("SELECT * FROM study_room_admin WHERE id = #{adminId}")
    StudyRoomAdmin getStudyRoomAdminById(int adminId);

    @Insert("INSERT INTO study_room_admin (name, email) VALUES (#{name}, #{email})")
    void createStudyRoomAdmin(StudyRoomAdmin studyRoomAdmin);

    @Update("UPDATE study_room_admin SET name = #{name}, email = #{email} WHERE id = #{id}")
    void updateStudyRoomAdmin(StudyRoomAdmin studyRoomAdmin);

    @Delete("DELETE FROM study_room_admin WHERE id = #{adminId}")
    void deleteStudyRoomAdmin(int adminId);
}