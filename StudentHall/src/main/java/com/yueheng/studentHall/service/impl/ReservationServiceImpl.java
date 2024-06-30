package com.yueheng.studentHall.service.impl;

import com.yueheng.studentHall.mapper.ReservationMapper;
import com.yueheng.studentHall.pojo.Reservation;
import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.dto.ReservationDTO;
import com.yueheng.studentHall.pojo.dto.UsableRoomDTO;
import com.yueheng.studentHall.service.ReservationService;
import com.yueheng.studentHall.utils.UserHolder;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class ReservationServiceImpl implements ReservationService {
    private static final Logger log = LoggerFactory.getLogger(ReservationServiceImpl.class);
    private final ReservationMapper reservationMapper;

    public ReservationServiceImpl(ReservationMapper reservationMapper) {
        this.reservationMapper = reservationMapper;
    }

    @Override
    public ResponseResult getReservationById() {
        // 获取当前登录的用户
        int userId = UserHolder.getUser().getUserId();
        List<ReservationDTO> reservation = reservationMapper.getReservationById(userId);
        for (ReservationDTO reservationDTO : reservation) {
            reservationDTO.setDateTime(StringUtils.join(reservationDTO.getReservationTimeStart(), "到", reservationDTO.getReservationTimeEnd()));
            if (reservationDTO.getReservationStatus() == 0){
                reservationDTO.setStatus("已通过");
            }else if (reservationDTO.getReservationStatus() == 1){
                reservationDTO.setStatus("审核中");
            }else if (reservationDTO.getReservationStatus() == 2){
                reservationDTO.setStatus("已拒绝");
            } else if (reservationDTO.getReservationStatus() == 3){
                reservationDTO.setStatus("已取消");
            }
        }
        return new ResponseResult(200,reservation);
    }

    @Override
    public ResponseResult createReservation(Reservation reservation) {
        // 1.获取用户 ID
        int userId = UserHolder.getUser().getUserId();
        reservation.setUserId(userId);
        reservation.setReservationStatus(1);      //
        reservationMapper.createReservation(reservation);
        return new ResponseResult(200,"预约成功！");
    }

    @Override
    public ResponseResult updateReservation(Reservation reservation) {
        reservationMapper.updateReservation(reservation);
        if (reservation.getReservationStatus() == 1){
            return new ResponseResult(200,"申请成功！");
        }else{
            return new ResponseResult(200,"取消成功！");
        }
    }

    @Override
    public ResponseResult checkReservation(ReservationDTO reservationDTO) {
        reservationMapper.checkReservation(reservationDTO);
        if (reservationDTO.getReservationStatus() == 0){
            return new ResponseResult(200,"已设置审核通过！");
        }else {
            return new ResponseResult(200,"已设置审核不通过！");
        }
    }

    @Override
    public ResponseResult getReservation(String options) {
        List<ReservationDTO> reservation;
        if (Objects.isNull(options) || "null".equals(options)) {
            reservation = reservationMapper.getReservationNO();
        } else {
            reservation = reservationMapper.getReservation(options);
        }
        for (ReservationDTO reservationDTO : reservation) {
            reservationDTO.setDateTime(StringUtils.join(reservationDTO.getReservationTimeStart(), "到", reservationDTO.getReservationTimeEnd()));
            if (reservationDTO.getReservationStatus() == 0){
                reservationDTO.setStatus("已通过");
            }else if (reservationDTO.getReservationStatus() == 1){
                reservationDTO.setStatus("审核中");
            }
        }
        return new ResponseResult(200, reservation);
    }

    @Override
    public ResponseResult getReservationUsable(String options) {
        List<UsableRoomDTO> reservation;
        if (Objects.isNull(options) || "null".equals(options)) {
            reservation = reservationMapper.getReservationUsable();
        } else {
            reservation = reservationMapper.getReservationUsableByOp(options);
        }
        for (int i = 0; i < reservation.size(); i++) {
            reservation.get(i).setStatus("可用");
        }
        return new ResponseResult(200, reservation);
    }
    // 实现其他自定义方法
}