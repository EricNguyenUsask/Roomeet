package com.tinder.firstservlet;

import com.tinder.bean.RoomChat;
import com.tinder.bean.User;
import com.tinder.dao.UserDatabase;
import com.tinder.util.ConnectionPro;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "RoomServlet", urlPatterns = "/room")
public class RoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth_user = (User) session.getAttribute("auth_user");
        ArrayList<RoomChat> chats = null;
        if(auth_user != null){
            UserDatabase db =  new UserDatabase(ConnectionPro.getConnection());
             chats = db.getAllChats(auth_user.getRoomId());
        }

        request.setAttribute("allDataChats", chats);
        RequestDispatcher rd = request.getRequestDispatcher("/chatbox.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
