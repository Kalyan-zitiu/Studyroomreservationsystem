package com.yueheng.studentHall.controller;

import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.RoleUser;
import com.yueheng.studentHall.service.RoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/role_user")
public class RoleUserController {
    @Autowired
    private RoleUserService roleUserService;

    public ResponseResult getRoleUserById(int adminId) {
        return null;
    }

    /**
     * 获取所有用户
     * @return
     */
    @PreAuthorize("hasAnyAuthority('operation')")
    @GetMapping("/getRoleUserAll")
    public ResponseResult getRoleUserAll(@RequestParam("key") String key) {
        return roleUserService.getRoleUserAll(key);
    }

    public ResponseResult createRoleUser(RoleUser roleUser) {
        return null;
    }

    public ResponseResult updateRoleUser(RoleUser roleUser) {
        return null;
    }

    public ResponseResult deleteRoleUserById(int id) {
        return null;
    }
}
