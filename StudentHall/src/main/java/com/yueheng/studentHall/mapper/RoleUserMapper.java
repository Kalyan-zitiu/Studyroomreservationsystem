package com.yueheng.studentHall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yueheng.studentHall.pojo.Role;
import com.yueheng.studentHall.pojo.RoleUser;
import com.yueheng.studentHall.pojo.dto.RoleUserDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RoleUserMapper extends BaseMapper<RoleUser> {
    @Select("select user.user_name,role.role_name,user.user_id, user.email,user.phone\n" +
            "    from user\n" +
            "    join user_role\n" +
            "    on user.user_id = user_role.user_id\n" +
            "    join role\n" +
            "    on user_role.role_id = role.role_id;")
    List<RoleUserDTO> getRoleUserAll();

    @Select("select user.user_name, role.role_name, user.user_id, user.email, user.phone\n" +
            "from user\n" +
            "join user_role\n" +
            "on user.user_id = user_role.user_id\n" +
            "join role\n" +
            "on user_role.role_id = role.role_id\n" +
            "where user.user_name like CONCAT('%', #{key}, '%')")
    List<RoleUserDTO> getRoleUserAllByKey(String key);

    @Insert("INSERT INTO user_role(user_id,role_id) values (#{userId},#{roleId})")
    int createRoleUser(RoleUser roleUser);
    void updateRoleUser(RoleUser roleUser);

    @Delete("DELETE FROM user_role WHERE user_id = #{userId}")
    void deleteRoleUserById(int userId);
}
