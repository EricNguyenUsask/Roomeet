package com.tinder.firstservlet;

import com.google.gson.Gson;
import com.tinder.bean.User;
import com.tinder.dao.UserDatabase;
import com.tinder.util.ConnectionPro;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "TestFilterServlet", urlPatterns = "/filter-user")
public class MatchingServlet extends HttpServlet {
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
//                HttpSession session = request.getSession();
//                session.setAttribute("logUser", user);
//                response.sendRedirect("welcome.jsp");
                response.sendRedirect("http://localhost:8080/CreateRoom?id="+user.getId());

            }else{
                out.println("user not found");
            }

            out.println("</body>");
            out.println("</html>");
        }
    }



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDatabase db =  new UserDatabase(ConnectionPro.getConnection());
        ArrayList<User> users = db.getAllUsers();

        request.setAttribute("allDataUser", users);
        RequestDispatcher rd = request.getRequestDispatcher("/Matching_filter.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestType = request.getParameter("requestType");
        UserDatabase db =  new UserDatabase(ConnectionPro.getConnection());
        ArrayList<User> users = new ArrayList<>();
        System.out.println("Posted!");
        if (requestType.equals("filter")) {
            System.out.println("get filter");
            // receive post request
            String nameLocation = request.getParameter("location");
            String nameGender = request.getParameter("gender");
            Integer minbud = Integer.valueOf(request.getParameter("minBud"));
            Integer maxbud = Integer.valueOf(request.getParameter("maxBud"));
            Integer minage = Integer.valueOf(request.getParameter("minAge"));
            Integer maxage = Integer.valueOf(request.getParameter("maxAge"));
            //Integer id = Integer.valueOf(request.getParameter("id"));

            users = db.getListUserByFilter(nameLocation, nameGender,minage,maxage,minbud,maxbud);
            for(User us : users){
                System.out.println("ID: " + us.getId());
            }
            System.out.println("Filtering");
        } else if (requestType.equals("match")) {
            System.out.println("Matching!");
            if (request.getSession().getAttribute("auth_user") == null) {
                System.out.println("Not logged in - everyone");
                users = db.getAllUsers();
            } else {
                System.out.println("Getting matched list...");;
                User user = (User) request.getSession().getAttribute("auth_user");
                users = db.getListUserByMatching(user);
                System.out.println("Get " + users.size() + " matched users");
            }
        }

        // test in terminal
        for (User s : users)
        {
            System.out.print("Name, email, avatar : ");
            System.out.println(s.getName() + " " + s.getEmail() + " " + s.getAvatar());
        }

        if(users!=null){
            response.setContentType("application/json");
            new Gson().toJson(users, response.getWriter());

        }else{
            System.out.println("user not found");
        }

    }
}
