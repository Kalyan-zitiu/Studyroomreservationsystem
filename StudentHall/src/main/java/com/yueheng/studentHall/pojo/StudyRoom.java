package com.yueheng.studentHall.pojo;

public class StudyRoom {
    private int studyRoomId;
    private String studyRoomNumber;
    private String type;
    private int capacity;
    private String facilities;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getStudyRoomId() {
        return studyRoomId;
    }

    public void setStudyRoomId(int studyRoomId) {
        this.studyRoomId = studyRoomId;
    }

    public String getStudyRoomNumber() {
        return studyRoomNumber;
    }

    public void setStudyRoomNumber(String studyRoomNumber) {
        this.studyRoomNumber = studyRoomNumber;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getFacilities() {
        return facilities;
    }

    public void setFacilities(String facilities) {
        this.facilities = facilities;
    }
}