package com.yueheng.studentHall.controller;

import com.yueheng.studentHall.pojo.Permission;
import com.yueheng.studentHall.service.PermissionService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/permissions")
public class PermissionController___ {
    private final PermissionService permissionService;

    public PermissionController___(PermissionService permissionService) {
        this.permissionService = permissionService;
    }

    /**
     *
     * @param permissionId
     * @return
     */
    @GetMapping("/{permissionId}")
    public ResponseEntity<Permission> getPermissionById(@PathVariable int permissionId) {
        Permission permission = permissionService.getPermissionById(permissionId);
        if (permission != null) {
            return ResponseEntity.ok(permission);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public ResponseEntity<Void> createPermission(@RequestBody Permission permission) {
        permissionService.createPermission(permission);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @PutMapping("/{permissionId}")
    public ResponseEntity<Void> updatePermission(@PathVariable int permissionId, @RequestBody Permission permission) {
        Permission existingPermission = permissionService.getPermissionById(permissionId);
        if (existingPermission != null) {
            permission.setPermissionId(permissionId);
            permissionService.updatePermission(permission);
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{permissionId}")
    public ResponseEntity<Void> deletePermission(@PathVariable int permissionId) {
        permissionService.deletePermission(permissionId);
        return ResponseEntity.ok().build();
    }
    // 其他自定义方法的映射
}

