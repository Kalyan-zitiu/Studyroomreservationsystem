package com.yueheng.studentHall.controller;

import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.Role;
import com.yueheng.studentHall.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/roles")
public class RoleController {
    private final RoleService roleService;

    @Autowired
    public RoleController(RoleService roleService) {
        this.roleService = roleService;
    }

    @GetMapping("/{userId}")
    public ResponseResult getRoleByUserId(@PathVariable int userId) {
        return roleService.getRoleByUserId(userId);
    }

    /**
     * 获取所有的角色
     * @return
     */
    @PreAuthorize("hasAnyAuthority('operation')")
    @GetMapping("/getRoleAll")
    public ResponseResult getRoleAll(@RequestParam String key){
        return roleService.getRoleAll(key);
    }

    /**
     * 创建用户角色
     * @param role
     * @return
     */
    @PreAuthorize("hasAnyAuthority('operation')")
    @PostMapping
    public ResponseResult createRole(@RequestBody Role role) {
        return roleService.createRole(role);
    }

    /**
     * 修改角色信息
     * @param role
     */
    @PutMapping("/updateRole")
    public ResponseResult updateRole(@RequestBody Role role) {
        return roleService.updateRole(role);
    }

    @PreAuthorize("hasAnyAuthority('operation')")
    @DeleteMapping("/{roleId}")
    public ResponseResult deleteRole(@PathVariable int roleId) {
        return roleService.deleteRole(roleId);
    }
}