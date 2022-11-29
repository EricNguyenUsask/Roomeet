package com.tinder.firstservlet;

import com.tinder.bean.Room;
import com.tinder.bean.User;
import com.tinder.dao.RoomDatabase;
import com.tinder.dao.UserDatabase;
import com.tinder.util.ConnectionPro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AddRoomServlet", value = "/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth_user = (User) session.getAttribute("auth_user");
        UserDatabase user =  new UserDatabase(ConnectionPro.getConnection());
        ArrayList<User> us = user.getUsersInRoom(auth_user.getRoomId());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth_user = (User) session.getAttribute("auth_user");

        String room_name = request.getParameter("room");
        RoomDatabase db_room =  new RoomDatabase(ConnectionPro.getConnection());
        boolean checkExists = db_room.checkRoomExists(room_name);
        if(checkExists) {
            System.out.println("room exists");
        }else {
            boolean rm = db_room.addRoom(room_name);
            if(rm == true) { // add room success
                Room room = db_room.getRoomByName(room_name);

                UserDatabase data =  new UserDatabase(ConnectionPro.getConnection());
                data.saveGroup(room.getId(), auth_user.getEmail());
                // remove current session and add new session
                auth_user.setRoomId(room.getId()) ;
                auth_user.setRoomName(room_name);
                request.getSession().setAttribute("auth_user", auth_user);
                // redirect
                response.sendRedirect("http://localhost:8080/create-room");
            }else {
                System.out.println("error");
            }
        }


    }
}
