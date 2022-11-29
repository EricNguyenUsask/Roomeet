package com.tinder.bean;

import java.util.Date;

public class RoomChat {
    private int id;
    private int room_id;
    private int user_id;
    private String message;
    private String user_name;
    private Date date;

    public  RoomChat() {

    }
    public RoomChat(Integer user_id, Integer room_id, String user_name, String message) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.room_id = room_id;
        this.message = message;
    }
    public RoomChat(Integer user_id, Integer room_id, String user_name, String message, Date date) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.room_id = room_id;
        this.message = message;
        this.date = date;
    }

    public int getId() { return id; }

    public Integer getRoomId() {
        return room_id;
    }

    public Integer getUserId() {
        return user_id;
    }

    public String getMessage() {
        return message;
    }

    public String getUserName() {
        return user_name;
    }
    public  Date getDate() {return  date;}

    public void setId(int id) {
        this.id = id;
    }

    public void setRoomId(Integer room_id) {
        this.room_id = room_id;
    }

    public void setUserId(Integer user_id) {
        this.user_id = user_id;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setUserName(String user_name) {
        this.user_name = user_name;
    }
}
