package com.yueheng.studentHall.service.impl;

import com.yueheng.studentHall.mapper.RoleUserMapper;
import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.RoleUser;
import com.yueheng.studentHall.pojo.dto.RoleUserDTO;
import com.yueheng.studentHall.service.RoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleUserServiceImpl implements RoleUserService {
    @Autowired
    private RoleUserMapper roleUserMapper;
    @Override
    public ResponseResult getRoleUserById(int adminId) {
        return null;
    }

    @Override
    public ResponseResult createRoleUser(RoleUser roleUser) {
        roleUserMapper.createRoleUser(roleUser);
        return new ResponseResult(200,"创建成功！");
    }

    @Override
    public ResponseResult updateRoleUser(RoleUser roleUser) {
        return null;
    }

    @Override
    public ResponseResult deleteRoleUserById(int id) {
        return null;
    }

    @Override
    public ResponseResult getRoleUserAll(String key) {
        // 1.如果传过来的 key 为空，则表示不搜索
        List<RoleUserDTO> roleUserAll;
        if (key.equals("")){
            roleUserAll = roleUserMapper.getRoleUserAll();
        }else{
            // 2.否则表示搜索
            roleUserAll = roleUserMapper.getRoleUserAllByKey(key);
        }
        return new ResponseResult(200,roleUserAll);
    }
}
