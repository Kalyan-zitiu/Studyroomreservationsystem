package com.yueheng.studentHall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yueheng.studentHall.pojo.Reservation;
import com.yueheng.studentHall.pojo.dto.ReservationDTO;
import com.yueheng.studentHall.pojo.dto.UsableRoomDTO;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ReservationMapper extends BaseMapper<Reservation> {
    @Select("select type,facilities,location,reservation_status,reservation_id,reason,\n" +
            "       reservation_time_start,reservation_time_end\n" +
            "from reservation\n" +
            "         join study_room_details on reservation.study_details_id = study_room_details.id\n" +
            "         join study_room on study_room_details.study_room_id = study_room.study_room_id\n" +
            "where user_id = #{userId};")
    List<ReservationDTO> getReservationById(int userId);

    @Select("select type,facilities,location,id\n" +
            "       from reservation\n" +
            "join study_room_details on reservation.study_details_id = study_room_details.id\n" +
            "join study_room on study_room_details.study_room_id = study_room.study_room_id\n" +
            "where type = #{options} and reservation_status != 0;")
    List<UsableRoomDTO> getReservationUsableByOp(String options);

    @Select("select type,facilities,location,id\n" +
            "       from reservation\n" +
            "join study_room_details on reservation.study_details_id = study_room_details.id\n" +
            "join study_room on study_room_details.study_room_id = study_room.study_room_id\n" +
            "where reservation_status != 0")
    List<UsableRoomDTO> getReservationUsable();

    @Select("select user_name,type,reason,reservation_time_start,reservation_time_end,facilities,location,reservation_id,reservation_status\n" +
            "       from reservation\n" +
            "join user on reservation.user_id = user.user_id\n" +
            "join study_room_details on reservation.study_details_id = study_room_details.id\n" +
            "join study_room on study_room_details.study_room_id = study_room.study_room_id\n" +
            "where reservation_status != 2 and reservation_status != 3")
    List<ReservationDTO> getReservationNO();

    @Select("select user_name, type, reason, reservation_time_start, reservation_time_end, facilities, location, reservation_id,reservation_status " +
            "from reservation " +
            "join user on reservation.user_id = user.user_id " +
            "join study_room_details on reservation.study_details_id = study_room_details.id " +
            "join study_room on study_room_details.study_room_id = study_room.study_room_id " +
            "where type LIKE #{options} and reservation_status != 2 and reservation_status != 3")
    List<ReservationDTO> getReservation(String options);

    @Insert("INSERT INTO reservation (" +
            "user_id,study_details_id,reason,reservation_status) " +
            "VALUES (#{userId}, #{studyDetailsId}, #{reason}, #{reservationStatus})")
    void createReservation(Reservation reservation);

    @Update("UPDATE reservation SET reservation_status = #{reservationStatus} WHERE reservation_id = #{reservationId}")
    void updateReservation(Reservation reservation);

    @Update("update reservation set reservation_status = #{reservationStatus} WHERE reservation_id = #{reservationId}")
    void checkReservation(ReservationDTO reservationDTO);
}