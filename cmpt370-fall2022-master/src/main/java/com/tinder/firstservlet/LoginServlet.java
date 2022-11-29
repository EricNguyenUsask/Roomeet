package com.tinder.firstservlet;

import com.tinder.bean.User;
import com.tinder.dao.UserDatabase;
import com.tinder.util.ConnectionPro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            //feth data from login form

            String logemail = request.getParameter("email");
            String logpass = request.getParameter("password");

            UserDatabase db =  new UserDatabase(ConnectionPro.getConnection());
            User user = db.logUser(logemail, logpass);

            if(user!=null){
                HttpSession session = request.getSession();
                session.setAttribute("auth_user", user);
                response.sendRedirect("http://localhost:8080/filter-user?id="+user.getId());

            }else{
                response.sendRedirect("http://localhost:8080");
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
