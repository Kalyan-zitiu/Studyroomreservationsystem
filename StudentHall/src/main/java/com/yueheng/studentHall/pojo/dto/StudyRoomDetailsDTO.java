package com.yueheng.studentHall.pojo.dto;

public class StudyRoomDetailsDTO {
    private int id;
    private String location;
    private int studyRoomId;
    private int reservationFrequency;
    private int usageFrequency;
    private float usagePercent;

    public float getUsagePercent() {
        return usagePercent;
    }

    public void setUsagePercent(float usagePercent) {
        this.usagePercent = usagePercent;
    }

    public int getReservationFrequency() {
        return reservationFrequency;
    }

    public void setReservationFrequency(int reservationFrequency) {
        this.reservationFrequency = reservationFrequency;
    }

    public int getUsageFrequency() {
        return usageFrequency;
    }

    public void setUsageFrequency(int usageFrequency) {
        this.usageFrequency = usageFrequency;
    }

    public StudyRoomDetailsDTO() {
    }

    public StudyRoomDetailsDTO(int id, String location, int studyRoomId) {
        this.id = id;
        this.location = location;
        this.studyRoomId = studyRoomId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getStudyRoomId() {
        return studyRoomId;
    }

    public void setStudyRoomId(int studyRoomId) {
        this.studyRoomId = studyRoomId;
    }

    @Override
    public String toString() {
        return "StudyRoomDetailsDTO{" +
                "id=" + id +
                ", location='" + location + '\'' +
                ", studyRoomId=" + studyRoomId +
                '}';
    }
}