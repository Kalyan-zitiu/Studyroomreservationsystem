package com.yueheng.studentHall.pojo;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.yueheng.studentHall.utils.BooleanToIntDeserializer;

public class Role {
    private int roleId;
    @JsonDeserialize(using = BooleanToIntDeserializer.class)
    private int status;
    private String roleName;
    private String roleSign;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getRoleSign() {
        return roleSign;
    }

    public void setRoleSign(String roleSign) {
        this.roleSign = roleSign;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}