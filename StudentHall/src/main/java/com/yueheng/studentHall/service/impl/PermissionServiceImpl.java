package com.yueheng.studentHall.service.impl;

import com.yueheng.studentHall.mapper.PermissionMapper;
import com.yueheng.studentHall.pojo.Permission;
import com.yueheng.studentHall.service.PermissionService;
import org.springframework.stereotype.Service;

@Service
public class PermissionServiceImpl implements PermissionService {
    private final PermissionMapper permissionMapper;

    public PermissionServiceImpl(PermissionMapper permissionMapper) {
        this.permissionMapper = permissionMapper;
    }

    @Override
    public Permission getPermissionById(int permissionId) {
        return permissionMapper.getPermissionById(permissionId);
    }

    @Override
    public void createPermission(Permission permission) {
        permissionMapper.createPermission(permission);
    }

    @Override
    public void updatePermission(Permission permission) {
        permissionMapper.updatePermission(permission);
    }

    @Override
    public void deletePermission(int permissionId) {
        permissionMapper.deletePermission(permissionId);
    }
    // 实现其他自定义方法
}









