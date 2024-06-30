package com.yueheng.studentHall.pojo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Reservation {
    private int reservationId;
    private int userId;
    private int studyDetailsId;
    private LocalDateTime reservationTimeEnd;
    private LocalDateTime reservationTimeStart;
    private int reservationStatus;
    private String reason;
}