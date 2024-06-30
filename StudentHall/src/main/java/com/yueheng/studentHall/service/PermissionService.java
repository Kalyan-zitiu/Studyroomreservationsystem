package com.yueheng.studentHall.service;

import com.yueheng.studentHall.pojo.Permission;

public interface PermissionService {
    Permission getPermissionById(int permissionId);
    void createPermission(Permission permission);
    void updatePermission(Permission permission);
    void deletePermission(int permissionId);
    // 其他自定义方法
}









