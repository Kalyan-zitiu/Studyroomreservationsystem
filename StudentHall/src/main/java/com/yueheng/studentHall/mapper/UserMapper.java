    package com.yueheng.studentHall.mapper;

    import com.baomidou.mybatisplus.core.mapper.BaseMapper;
    import com.yueheng.studentHall.pojo.User;
    import org.apache.ibatis.annotations.*;

    import java.util.List;

    @Mapper
    public interface UserMapper extends BaseMapper<User> {
        @Select("SELECT * FROM user WHERE user_id = #{userId}")
        User getUserById(int userId);

        @Select("SELECT * FROM user")
        List<User> getAllUser();

        @Select("SELECT * FROM user WHERE user_name like CONCAT('%', #{key}, '%')")
        List<User> searchUser(String key);

        @Insert("INSERT INTO user (user_name, password, email,phone) VALUES (#{userName}, #{password}, #{email}, #{phone})")
        void createUser(User user);

        @Update("UPDATE user SET password = #{password}, user_name = #{userName}," +
                " phone = #{phone}, email = #{email} WHERE user_id = #{userId}")
        void updateUser(User user);

        @Update("UPDATE user SET user_name = #{userName}," +
                " phone = #{phone}, email = #{email} WHERE user_id = #{userId}")
        void updateUserNoPw(User user);

        @Delete("DELETE FROM user WHERE user_id = #{userId}")
        void deleteUser(int userId);

    }