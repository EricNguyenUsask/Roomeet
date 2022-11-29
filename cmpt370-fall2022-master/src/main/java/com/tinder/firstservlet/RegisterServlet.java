package com.tinder.firstservlet;

import com.tinder.bean.User;
import com.tinder.dao.UserDatabase;
import com.tinder.util.ConnectionPro;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");


            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");

            //make user object
            User userModel = new User (name, email, password, firstname, lastname);

            //create database model
            UserDatabase regUser = new UserDatabase(ConnectionPro.getConnection());
            if (regUser.saveUser(userModel)) {
                User usLogged = regUser.logUser(email, password);

                System.out.println("Id = " + usLogged.getId());
                response.sendRedirect("http://localhost:8080/edit-profile?id=" + usLogged.getId());
            } else {
                String errorMessage = "User Available";
                HttpSession regSession = request.getSession();
                regSession.setAttribute("RegError", errorMessage);
                response.sendRedirect("registration.jsp");
                System.out.println("cant register");
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
