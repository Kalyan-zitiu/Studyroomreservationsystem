package com.yueheng.studentHall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yueheng.studentHall.pojo.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RoleMapper extends BaseMapper<Role> {
    @Select("SELECT r.role_name\n" +
            "FROM role as r\n" +
            "join user_role as ur on ur.role_id = r.role_id\n" +
            "where user_id = #{userId};")
    Role getRoleByUserId(int userId);

    @Select("SELECT * FROM role")
    List<Role> getRoleAll();

    @Select("SELECT * FROM role where `role_name` like CONCAT('%',#{key},'%')")
    List<Role> getRoleAllByKey(String key);

    @Insert("INSERT INTO role(role_name,role_sign,status) " +
            "values(#{roleName}, #{roleSign}, #{status})")
    int createRole(Role role);

    @Update("UPDATE role SET role_name = #{roleName}, role_sign = #{roleSign}, status = #{status} WHERE role_id = #{roleId}")
    int updateRole(Role role);

    @Delete("DELETE FROM role WHERE role_id = #{roleId}")
    void deleteRole(int roleId);
}