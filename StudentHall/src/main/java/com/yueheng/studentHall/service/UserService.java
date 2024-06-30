package com.yueheng.studentHall.service;

import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.User;

import java.util.List;

public interface UserService {
    ResponseResult getUserById();

    ResponseResult login(User user);

    ResponseResult createUser(User user);
    ResponseResult updateUser(User user);
    ResponseResult deleteUser();
    List<User> getAllUser();

    List<User> searchUser(String key);

    ResponseResult deleteUserById(int userId);

    ResponseResult SysCreateUser(User user);
    // 其他自定义方法
}