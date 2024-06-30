package com.yueheng.studentHall.service.impl;

import com.yueheng.studentHall.mapper.RoleMapper;
import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.Role;
import com.yueheng.studentHall.pojo.dto.RoleUserDTO;
import com.yueheng.studentHall.service.RoleService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    private final RoleMapper roleMapper;

    public RoleServiceImpl(RoleMapper roleMapper) {
        this.roleMapper = roleMapper;
    }

    @Override
    public ResponseResult getRoleByUserId(int roleId) {
        Role roleByUserId = roleMapper.getRoleByUserId(roleId);
        return new ResponseResult(200,roleByUserId);
    }

    public ResponseResult getRoleAll(String key){
        // 1.如果传过来的 key 为空，则表示不搜索
        List<Role> roleAll;
        if (key.equals("")){
            roleAll = roleMapper.getRoleAll();
        }else{
            // 2.否则表示搜索
            roleAll = roleMapper.getRoleAllByKey(key);
        }
        return new ResponseResult(200,roleAll);
    }

    @Override
    public ResponseResult createRole(Role role) {
        int role1 = roleMapper.createRole(role);
        if (role1>0){
            return new ResponseResult(200,"新增成功！");
        }else {
            return new ResponseResult(200,"新增失败！");
        }
    }

    @Override
    public ResponseResult updateRole(Role role) {
        int i = roleMapper.updateRole(role);
        if (i>0){
            return new ResponseResult(200,"修改成功！");
        }else{
            return new ResponseResult(500,"修改失败！");
        }
    }

    @Override
    public ResponseResult deleteRole(int roleId) {
        try{
            roleMapper.deleteRole(roleId);
        }catch (RuntimeException e){
            return new ResponseResult(500,"删除角色失败,因为有关联的用户。");
        }
        return new ResponseResult(200,"删除角色成功！");
    }
    // 实现其他自定义方法
}