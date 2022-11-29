package com.tinder.firstservlet;

import com.tinder.bean.Room;
import com.tinder.bean.User;
import com.tinder.dao.RoomDatabase;
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
import java.io.PrintWriter;
import java.util.ArrayList;

import static java.lang.Integer.parseInt;

@WebServlet(name = "GroupServlet", urlPatterns = "/create-room")

public class GroupServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GroupServlet</title>");
            out.println("</head>");
            out.println("<body>");

        System.out.println("helo");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User auth_user = (User) session.getAttribute("auth_user");
        Room rm = null;
        ArrayList<User> lst = null;
        if(auth_user!= null) {
            UserDatabase user =  new UserDatabase(ConnectionPro.getConnection());
            lst = user.getUsersInRoom(auth_user.getRoomId());

            int room_id = auth_user.getRoomId();
            if(room_id != 0) {
                RoomDatabase db =  new RoomDatabase(ConnectionPro.getConnection());
                rm = db.getRoomById(room_id);
                System.out.println("rm" + rm.getName());
            }
        }
        request.setAttribute("dataRoom", rm);
        request.setAttribute("lst", lst);
        RequestDispatcher rd = request.getRequestDispatcher("/CreateRoom.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String id = request.getParameter("id");

        UserDatabase db =  new UserDatabase(ConnectionPro.getConnection());

        User check = db.checkUserHadRoom(email);
        if(check == null) {
            String update = "not exists";
            response.setContentType("text/plain");
            response.getWriter().write(update);
        }else {
            System.out.println(check.getRoomId() + "test");
            if(check.getRoomId() == 0) {
                db.saveGroup(parseInt(id),email);
                String update = "true";
                response.setContentType("text/plain");
                response.getWriter().write(update);
            }else {
                //  room exist
                String update = "false";
                response.setContentType("text/plain");
                response.getWriter().write(update);
            }
        }
    }


//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }

}


