package com.yueheng.studentHall.pojo.dto;

import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class ReservationDTO {
    private int reservationId;
    private int reservationStatus;
    private String userName;
    private String type;
    private String location;
    private String reason;
    private String facilities;
    private String dateTime;

    private String status;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime reservationTimeStart;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime reservationTimeEnd;
}