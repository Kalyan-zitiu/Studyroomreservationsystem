package com.yueheng.studentHall.service;

import com.yueheng.studentHall.pojo.Reservation;
import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.dto.ReservationDTO;

public interface ReservationService {
    ResponseResult getReservationById();
    ResponseResult createReservation(Reservation reservation);
    ResponseResult updateReservation(Reservation reservation);
    ResponseResult checkReservation(ReservationDTO reservationStatus);
    ResponseResult getReservation(String options);

    ResponseResult getReservationUsable(String options);
    // 其他自定义方法
}