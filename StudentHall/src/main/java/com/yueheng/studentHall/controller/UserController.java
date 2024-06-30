package com.yueheng.studentHall.controller;

import com.yueheng.studentHall.pojo.ResponseResult;
import com.yueheng.studentHall.pojo.User;
import com.yueheng.studentHall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("users")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 获取用户个人信息
     * @return
     */
    @PreAuthorize("hasAnyAuthority('user','operation')")
    @GetMapping("/")
    public ResponseResult getUserById() {
        return userService.getUserById();
    }

    /**
     * 查看所有用户
     * @return
     */
    @PreAuthorize("hasAnyAuthority('operation')")
    @GetMapping("/getAllUser")
    public List<User> getAllUser() {
        return userService.getAllUser();
    }

    /**
     * 用户登录
     * @param user
     * @return
     */
    @PostMapping("/login")
    public ResponseResult login(@RequestBody User user){
        //登录
        return userService.login(user);
    }

    /**
     * 系统管理员创建用户
     * @param user
     * @return
     */
    @PreAuthorize("hasAnyAuthority('operation')")
    @PostMapping("/SysCreateUser")
    public ResponseResult SysCreateUser(@RequestBody User user){
        return userService.SysCreateUser(user);
    }

    /**
     * 搜索用户
     * @return
     */
    @PreAuthorize("hasAnyAuthority('operation')")
    @GetMapping("/searchUser")
    public List<User> searchUser(@RequestParam("key") String key) {
        return userService.searchUser(key);
    }

    /**
     * 注册用户
     * @param user
     */
    @PostMapping("register")
    public ResponseResult createUser(@RequestBody User user) {
        return userService.createUser(user);
    }

    /**
     * 修改用户信息
     * @param user
     */
    @PreAuthorize("hasAnyAuthority('operation')")
    @PutMapping("/updateUser")
    public ResponseResult updateUser(
                                     @RequestBody User user) {
        return userService.updateUser(user);
    }

    /**
     * 注销用户
     */
    @PreAuthorize("hasAnyAuthority('user','operation')")
    @DeleteMapping("/")
    public ResponseResult deleteUser() {
        userService.deleteUser();
        return new ResponseResult(200,"注销成功！");
    }

    /**
     * 删除用户
     */
    @PreAuthorize("hasAnyAuthority('operation')")
    @DeleteMapping("/{userId}")
    public ResponseResult deleteUser(@PathVariable("userId") int userId) {
        return userService.deleteUserById(userId);
    }
}