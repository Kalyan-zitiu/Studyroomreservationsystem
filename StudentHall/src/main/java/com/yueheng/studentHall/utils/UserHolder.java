package com.yueheng.studentHall.utils;


import com.yueheng.studentHall.pojo.dto.UserDTO;

public class UserHolder {
    private static final ThreadLocal<UserDTO> tl = new ThreadLocal<>();
    public static void  saveUser(UserDTO userDTO){tl.set(userDTO);}
    public static void  removeUser(){tl.remove();}

    public static UserDTO getUser(){return tl.get();}
}
