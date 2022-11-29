package com.tinder.dao;

import com.tinder.bean.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RoomDatabase {

    Connection con;
    public RoomDatabase(Connection con) {
        this.con = con;
    }

    public Room getRoomById(Integer room_id) {
        Room rm = null;
        try {
            String query_room = "select * from rooms where id=?";
            PreparedStatement ps = this.con.prepareStatement(query_room);
            ps.setInt(1, room_id);
            ResultSet rs  = ps.executeQuery();
            if(rs.next() == true) {
                rm = new Room();
                rm.setId(rs.getInt("id"));
                rm.setName(rs.getString("name_room"));
            }
        }catch (Exception ex) {
            ex.printStackTrace();
        }
        return rm;
    }

    public Boolean checkRoomExists(String room_name) {
        boolean checkExists = false;
        try {
            String query = "select * from rooms WHERE name_room = ?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, room_name);
            ResultSet rs  = pt.executeQuery();

            if(rs.next()){
                checkExists = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return checkExists;
    }

    public boolean addRoom(String room_name) {
        boolean rm = false;
        try {
            String query = "insert into rooms(name_room) values(?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, room_name);

            int rs  = ps.executeUpdate();
            if(rs == 1) {
                rm = true;
            }
        }catch (Exception ex) {
            ex.printStackTrace();
        }
        return rm;
    }

    // select room
    public Room getRoomByName(String room_name) {
        Room rm = null;
        try {
            String query_room = "select * from rooms where name_room like ?";
            PreparedStatement ps = this.con.prepareStatement(query_room);
            ps.setString(1, room_name);
            ResultSet rs  = ps.executeQuery();
            if(rs.next() == true){
                rm = new Room();
                rm.setId(rs.getInt("id"));
                rm.setName(rs.getString("name_room"));
            }

        }catch (Exception ex) {
            ex.printStackTrace();
        }
        return rm;
//        try {
//            String query = "insert into rooms(name_room) values(?)";
//            PreparedStatement ps = this.con.prepareStatement(query);
//            ps.setString(1, room_name);
//
//            int rs  = ps.executeUpdate();
//            if(rs == 1) {
//                rm = true;
//            }
//        }catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return rm; // return ve room (set id, set name)
    }
}
