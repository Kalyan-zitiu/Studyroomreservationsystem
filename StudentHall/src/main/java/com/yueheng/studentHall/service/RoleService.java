package com.yueheng.studentHall.service;

import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.Role;

public interface RoleService {
    ResponseResult getRoleByUserId(int roleId);
    ResponseResult createRole(Role role);
    ResponseResult updateRole(Role role);
    ResponseResult deleteRole(int roleId);
    ResponseResult getRoleAll(String key);
    // 其他自定义方法
}