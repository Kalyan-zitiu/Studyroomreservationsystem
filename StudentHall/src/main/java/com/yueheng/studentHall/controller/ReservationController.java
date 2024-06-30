package com.yueheng.studentHall.controller;

import com.yueheng.studentHall.pojo.Reservation;
import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.dto.ReservationDTO;
import com.yueheng.studentHall.service.ReservationService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/reservations")
public class ReservationController {
    private final ReservationService reservationService;

    public ReservationController(ReservationService reservationService) {
        this.reservationService = reservationService;
    }

    /**
     * 查看用户个人预约的情况
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_cancel')")
    @GetMapping("")
    public ResponseResult getReservationById() {
        return reservationService.getReservationById();
    }

    /**
     * 获取所有预约的自习室
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_room')")
    @GetMapping("/getReservation")
    public ResponseResult getReservation(@RequestParam(required = false) String options) {
        return reservationService.getReservation(options);
    }

    /**
     * 获取可用的自习室
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_cancel')")
    @GetMapping("/getReservationUsable")
    public ResponseResult getReservationUsable(@RequestParam(required = false) String options) {
        return reservationService.getReservationUsable(options);
    }


    /**
     * 预约自习室
     * @param reservation
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_cancel')")
    @PostMapping
    public ResponseResult createReservation(@RequestBody Reservation reservation) {
        return reservationService.createReservation(reservation);
    }

    /**
     * 取消预约
     * @param reservation
     * @return
     */
    @PreAuthorize("hasAnyAuthority('study_cancel')")
    @PutMapping("/updateReservation")
    public ResponseResult updateReservation(@RequestBody Reservation reservation) {
        return reservationService.updateReservation(reservation);
    }

    /**
     * 审核预约
     * @param reservationDTO
     * @return
     */
    @PreAuthorize("hasAnyAuthority('check_room')")
    @PutMapping("")
    public ResponseResult checkReservation(@RequestBody ReservationDTO reservationDTO) {
        return reservationService.checkReservation(reservationDTO);
    }
    // 其他自定义方法的映射
}