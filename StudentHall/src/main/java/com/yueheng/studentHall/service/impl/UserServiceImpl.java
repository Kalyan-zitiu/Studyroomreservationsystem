package com.yueheng.studentHall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yueheng.studentHall.mapper.RoleMapper;
import com.yueheng.studentHall.mapper.RoleUserMapper;
import com.yueheng.studentHall.mapper.UserMapper;
import com.yueheng.studentHall.pojo.*;
import com.yueheng.studentHall.service.UserService;
import com.yueheng.studentHall.utils.JwtUtil;
import com.yueheng.studentHall.utils.RedisCache;
import com.yueheng.studentHall.utils.UserHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private RoleUserMapper roleUserMapper;

    @Autowired
    private RoleMapper roleMapper;

    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public ResponseResult getUserById() {
        // 获取当前登录的用户
        int userId = UserHolder.getUser().getUserId();
        return new ResponseResult(200, userMapper.getUserById(userId));
    }

    @Override
    public ResponseResult login(User user) {
        //AuthenticationManager authenticate进行用户认证
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(user.getUserName(), user.getPassword());
        Authentication authenticate = authenticationManager.authenticate(authenticationToken);
        //如果认证没通过，给出对应的提示
        if (Objects.isNull(authenticate)) {
            throw new RuntimeException("登录失败");
        }else{
            //如果认证通过了，使用userid生成一个jwt jwt存入ResponseResult返回
            LoginUser loginUser = (LoginUser) authenticate.getPrincipal();
            String userid = String.valueOf(loginUser.getUser().getUserId());
            String jwt = JwtUtil.createJWT(userid);
            Role roleByUserId = roleMapper.getRoleByUserId(Integer.parseInt(userid));
            Map<String, String> map = new HashMap<>();
            map.put("token", jwt);
            map.put("roleName", roleByUserId.getRoleName());
            //把完整的用户信息存入redis  userid作为key
            redisCache.setCacheObject("login:" + userid, loginUser);
            return new ResponseResult(200, "登录成功", map);
        }
    }

    @Override
    public ResponseResult createUser(User user) {
        // 1.判断用户的用户名是否重复
        QueryWrapper<User> queryWrapper = new QueryWrapper<User>()
                .eq("user_name", user.getUserName());
        Integer i = userMapper.selectCount(queryWrapper);

        // 重复
        if (i > 1) {
            return new ResponseResult(500, "该用户名已存在，请换一个！");
        }

        // 不重复

        // 1.1.对用户输入的密码来进行加密
        String encode = passwordEncoder.encode(user.getPassword());
        user.setPassword(encode);
        // 2.创建用户
        userMapper.createUser(user);
        // 3.对普通用户进行赋予用户角色
        RoleUser ru = new RoleUser();
        // 3.1.获取注册用户的 ID
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<User>()
                .eq("user_name", user.getUserName());
        User user1 = userMapper.selectOne(userQueryWrapper);
        ru.setUserId(user1.getUserId());
        ru.setRoleId(3);
        // 4.1.创建普通用户角色
        roleUserMapper.createRoleUser(ru);
        return new ResponseResult<>(200, "注册成功！");
    }

    @Override
    public ResponseResult updateUser(User user) {
        // 1.判断用户是否存在
        User userByName = userMapper.selectOne(new QueryWrapper<User>()
                .eq("user_name", user.getUserName()));

        if (userByName == null) {
            // 表示创建用户
        }
        // 1.如果密码为空，则不修改密码
        if (user.getPassword() == null || user.getPassword().isEmpty()){
            userMapper.updateUserNoPw(user);
        } else {
            // 2.否则修改
        String encode = passwordEncoder.encode(user.getPassword());
        user.setPassword(encode);
        userMapper.updateUser(user);
        }
        return new ResponseResult(200, "修改用户信息成功！");
    }

    @Override
    public ResponseResult deleteUser() {
        // 1.获取用户 ID
        int userId = UserHolder.getUser().getUserId();
        // 2.删除用户的角色
        roleUserMapper.deleteRoleUserById(userId);
        // 3.删除用户的数据
        userMapper.deleteUser(userId);
        return new ResponseResult(200, "删除成功！");
    }

    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    @Override
    public List<User> searchUser(String key) {
        return userMapper.searchUser(key);
    }

    @Override
    public ResponseResult deleteUserById(int userId) {
        // 1.首先删除用户的角色
        roleUserMapper.deleteRoleUserById(userId);
        if (userId == UserHolder.getUser().getUserId()) {
            return new ResponseResult(200, "不可以删除自己！");
        }else{
            userMapper.deleteUser(userId);
            return new ResponseResult(200, "删除用户成功！！");
        }
        // 实现其他自定义方法
    }

    @Override
    public ResponseResult SysCreateUser(User user) {
        // 1.判断用户的用户名是否重复
        QueryWrapper<User> queryWrapper = new QueryWrapper<User>()
                .eq("user_name", user.getUserName());
        Integer i = userMapper.selectCount(queryWrapper);

        // 重复
        if (i > 1) {
            return new ResponseResult(200, "该用户名已存在，请换一个！");
        }

        // 不重复

        // 1.1.对用户输入的密码来进行加密
        String encode = passwordEncoder.encode(user.getPassword());
        user.setPassword(encode);
        // 2.创建用户
        userMapper.createUser(user);
        // 3.对普通用户进行赋予用户角色
        RoleUser ru = new RoleUser();
        // 3.1.获取注册用户的 ID
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<User>()
                .eq("user_name", user.getUserName());
        User user1 = userMapper.selectOne(userQueryWrapper);
        ru.setUserId(user1.getUserId());
        ru.setRoleId(3);
        // 4.1.创建普通用户角色
        roleUserMapper.createRoleUser(ru);
        return new ResponseResult(200,"创建用户成功！");
    }
}