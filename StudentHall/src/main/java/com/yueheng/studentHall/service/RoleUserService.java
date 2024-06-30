package com.yueheng.studentHall.service;


import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.RoleUser;
import com.yueheng.studentHall.pojo.dto.RoleUserDTO;

import java.util.List;

public interface RoleUserService {
    ResponseResult getRoleUserById(int adminId);
    ResponseResult createRoleUser(RoleUser roleUser);
    ResponseResult updateRoleUser(RoleUser roleUser);
    ResponseResult deleteRoleUserById(int id);
    ResponseResult getRoleUserAll(String key);
}
