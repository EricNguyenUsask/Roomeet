package com.tinder.firstservlet;


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

import static java.lang.Integer.parseInt;

@WebServlet(name = "edit_profileServlet", urlPatterns = "/edit-profile")

public class edit_profileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>editProfile</title>");
            out.println("</head>");
            out.println("<body>");


            String pronoun = request.getParameter("pronoun");
            String gender = request.getParameter("gender");
            String personality = request.getParameter("personality");
            String zodiac = request.getParameter("zodiac");
            String pet = request.getParameter("pet");
            String location = request.getParameter("location");



            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Page list-profile");
        String paramValue = request.getParameter("id");

        UserDatabase db =  new UserDatabase(ConnectionPro.getConnection());
        User us = db.getUserById(parseInt(paramValue));
        // test in terminal
       // System.out.println("User:" + us.getGender() + " successful");

        if(us!=null){
            request.setAttribute("dataUser", us);
            RequestDispatcher rd = request.getRequestDispatcher("/editProfile.jsp");
            rd.forward(request, response);

        }else{
            System.out.println("user not found");
            RequestDispatcher rd = request.getRequestDispatcher("/editProfile.jsp");
            rd.forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String namePronoun = request.getParameter("pronoun");
        Integer id = Integer.valueOf(request.getParameter("id"));
        String nameGender = request.getParameter("gender");
        String namePersonality = request.getParameter("personality");
        String nameZodiac = request.getParameter("zodiac");
        String nameSmoking = request.getParameter("smoking");
        String namePet = request.getParameter("pet");
        String nameAboutme = request.getParameter("comment");
        String nameDob = request.getParameter("dob");
        Integer namePrice = Integer.valueOf(request.getParameter("budget"));
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");


        String nameCity = request.getParameter("location");
//        Part filePart = request.getPart("file");
//
//        InputStream inputStream = null;
//        if (filePart != null) {
//            // obtains input stream of the upload file
//            inputStream = filePart.getInputStream();
//        }


        System.out.println(nameGender + namePronoun + nameCity + id+lastName);
        UserDatabase db =  new UserDatabase(ConnectionPro.getConnection());
         if(db.updateUser(id, namePronoun, nameGender,namePersonality,nameZodiac,nameSmoking,namePet,nameCity,nameAboutme,nameDob,namePrice,firstName,lastName)){
             String greetings = "Record Added update successful !!!";
             response.setContentType("text/plain");
             response.getWriter().write(greetings);
             System.out.println(lastName+"lastname");

         } else{
            System.out.println("update user profile false");
        }
    }
}
