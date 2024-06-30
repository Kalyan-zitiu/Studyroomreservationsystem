package com.yueheng.studentHall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yueheng.studentHall.pojo.Permission;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface PermissionMapper extends BaseMapper<Permission> {
    @Select("SELECT * FROM permission WHERE id = #{permissionId}")
    Permission getPermissionById(int permissionId);

    @Insert("INSERT INTO permission (name, description) VALUES (#{name}, #{description})")
    void createPermission(Permission permission);

    @Update("UPDATE permission SET name = #{name}, description = #{description} WHERE id = #{id}")
    void updatePermission(Permission permission);

    @Delete("DELETE FROM permission WHERE id = #{permissionId}")
    void deletePermission(int permissionId);

    @Select("SELECT p.permission_simplify\n" +
            "FROM permission as p\n" +
            "join role_permission as rp on rp.permission_id = p.permission_id\n" +
            "join role on role.role_id = rp.role_id\n" +
            "join user_role on user_role.role_id = role.role_id\n" +
            "where user_id = #{userId};")
    List<String> selectPermsByUserId(int userId);
}