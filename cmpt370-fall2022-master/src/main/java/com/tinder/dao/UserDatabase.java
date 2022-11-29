package com.tinder.dao;

import com.tinder.bean.RoomChat;
import com.tinder.bean.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Comparator;

public class UserDatabase {
    Connection con;
    ArrayList<User> rankedMatches;

    int i;

    public UserDatabase(Connection con) {
        this.con = con;
        rankedMatches = new ArrayList<>();
    }
    public ArrayList<RoomChat> getAllChats(Integer id_room) {
        ArrayList<RoomChat> lst = null;
        try {
            lst = new ArrayList<RoomChat>();
            String query = "select * from room_chats where room_id = ?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, id_room);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Integer user_id = rs.getInt("user_id");
                Integer room_id = rs.getInt("room_id");
                String user_name = rs.getString("user_name");
                String message = rs.getString("message");
                Date date = rs.getDate("date");
                RoomChat sp = new RoomChat(user_id, room_id, user_name, message,date);
                lst.add(sp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }
    public boolean saveChat(RoomChat room) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into room_chats(user_id, room_id, user_name, message) values(?,?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, room.getUserId());
            pt.setInt(2, room.getRoomId()); // lấy ra
            pt.setString(3, room.getUserName());
            pt.setString(4, room.getMessage());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    //for register user
    public boolean saveUser(User user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into user(name,email,password, firstname, lastname,location,pronoun, gender, personality, zodiac,smoking, pet, comment,budget) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, user.getName());
            pt.setString(2, user.getEmail());
            pt.setString(3, user.getPassword());
            pt.setString(4, user.getFirstName());
            pt.setString(5, user.getLastName());
            pt.setString(6, user.getLocation());
            pt.setString(7, user.getPronoun());
            pt.setString(8, user.getGender());
            pt.setString(9, user.getPersonality());
            pt.setString(10, user.getZodiac());
            pt.setString(11, user.getSmoking());


            pt.setString(12, user.getPet());
            pt.setString(13, user.getComment());
            pt.setInt(14, user.getBudget());




            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    public boolean updateUser(Integer id, String pronoun, String gender, String personality, String zodiac, String smoking, String pet, String location, String comment, String dob, Integer budget, String firstname, String lastname) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "UPDATE user SET pronoun = ?, gender = ?, location = ?, personality = ?, zodiac = ?, smoking = ?, pet = ?, comment = ?, dob =?, budget = ?, firstname = ?, lastname = ? WHERE id = ?";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, pronoun);
            pt.setString(2, gender);
            pt.setString(3,location);

            pt.setString(4,personality);
            pt.setString(5,zodiac);
            pt.setString(6,smoking);
            pt.setString(7,pet);
            pt.setString(8,comment);
            pt.setString(9,dob);
            pt.setInt(10, budget);
            pt.setString(11,firstname);
            pt.setString(12,lastname);






            //pt.setBlob(13, file);
            pt.setInt(13, id);

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    public ArrayList<User> getAllUsers() {
        ArrayList<User> lst = null;
        try {
            lst = new ArrayList<User>();
            String query = "select * from user";
            PreparedStatement ps = this.con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Integer id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String avatar = rs.getString("img_avatar");
                String location = rs.getString("location");
                User sp = new User(id, name, email, avatar,location);
                lst.add(sp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lst;
    }
    public ArrayList<User> getUsersInRoom(Integer room_id) {
        ArrayList<User> lst = null;
        try {
            lst = new ArrayList<User>();
            String query = "select * from user where room_id = ?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, room_id);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                String name = rs.getString("name");
                String email = rs.getString("email");
                String avt = rs.getString("img_avatar");
                User sp = new User(avt,name, email);
                lst.add(sp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lst;
    }
    public User getUserById(Integer id) {
        User us = null;
        try {
            String query = "select * from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs  = ps.executeQuery();
            if(rs.next() == true) {
                us = new User();
                us.setFirstName(rs.getString("firstname")); //in table user
                us.setLastName(rs.getString("lastname"));
                us.setEmail(rs.getString("email"));
                us.setName(rs.getString("name"));
                us.setAvatar(rs.getString("img_avatar"));
                us.setPronoun(rs.getString("pronoun"));

                us.setGender(rs.getString("gender"));
                us.setLocation(rs.getString("location"));
                us.setPersonality(rs.getString("personality"));
                us.setZodiac(rs.getString("zodiac"));
                us.setSmoking(rs.getString("smoking"));

                us.setPet(rs.getString("pet"));
                us.setComment(rs.getString("comment"));
                us.setDob(rs.getString("dob"));
                us.setBudget(rs.getInt("budget"));



            }
        }catch (Exception ex) {
            ex.printStackTrace();
        }
        return us;
    }


    //login user success
    public User logUser(String email, String password) {
        User user = null;

        try {
            String query = "select * from user where email=? and password=? or name=? and password=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1,email);
            ps.setString(2, password);
            ps.setString(3,email);
            ps.setString(4, password);

            ResultSet rs  = ps.executeQuery();

            if(rs.next()){
                user = new User(); //
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRoomId(rs.getInt("room_id"));
                user.setGender(rs.getString("gender"));
                user.setLocation(rs.getString("location"));
                user.setPersonality(rs.getString("personality"));
                user.setPet(rs.getString("pet"));
                user.setSmoking(rs.getString("smoking"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    //filter
    public ArrayList<User> getListUserByFilter(String location, String gender, Integer minage, Integer maxage, Integer minbud, Integer maxbud) {
        ArrayList<User> lst = null;
        try {
            lst = new ArrayList<User>();
            System.out.println("query test"+minbud);
            String query = "select * from user where location LIKE ? AND gender LIKE ? AND budget BETWEEN ? and ? AND age BETWEEN ? and ?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, "%" + location + "%");
            ps.setString(2, "%" + gender + "%");
            ps.setInt(3, minbud);
            ps.setInt(4,maxbud);
            ps.setInt(5,minage);
            ps.setInt(6,maxage);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                String name = rs.getString("name");
                String email = rs.getString("email");
                String avatar = rs.getString("img_avatar");
                String location1 = rs.getString("location");
                String lastname = rs.getString("lastname");
                String dob = rs.getString("dob");
                String pronoun = rs.getString("pronoun");
                Integer id = rs.getInt("id");

                User sp = new User(name, email, avatar,location1,lastname,dob,pronoun,id);
                lst.add(sp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst; //return list user
    }
    public User FilterEmail(String email) {
        try {
            String query = "select * from user where email=? ";

            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setString(1,email);

            ResultSet rs  = ps.executeQuery();

            if(rs.next()){
                User newUser = new User();
                newUser.setEmail(rs.getString("email"));
                return newUser;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void destroy() {
        i = 0;
    }

    public boolean saveGroup(Integer id, String email) {
        boolean set = false;

        try {
            String query = "UPDATE user SET room_id = ? WHERE email = ?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, id);
            pt.setString(2, email);

            pt.executeUpdate();
            set = true;

        } catch (Exception e) {
            e.printStackTrace();

        }
        return set;
    }

    public User checkUserHadRoom(String email) {
        User newUser = null;
        try {
            String query = "select user.room_id from user WHERE email = ?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, email);
            ResultSet rs  = pt.executeQuery();

            if(rs.next()){
                newUser = new User();
                newUser.setRoomId(rs.getInt("room_id"));
                return newUser;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newUser;
    }


    public ArrayList<Integer> getExactMatch(String criteria, String cond) {
        ArrayList<Integer> list = new ArrayList<>();
        if (cond == null) return null;
        try {
            String query = "select * from user WHERE "+ criteria + " LIKE ?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, "%" + cond + "%");
            System.out.println(pt);
            ResultSet resultSet  = pt.executeQuery();

            // Get results from select statement
            while (resultSet.next()) {
                list.add(resultSet.getInt("id"));
            }
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Found " + list.size() + " users in the same " + criteria);
        return list;
    }

    public ArrayList<User> getListUserByMatching(User user) {
        if (user == null){
            System.out.println("User not found!");
        }
        ArrayList<String> allCond = user.getCriteriaList();
        ArrayList<ArrayList<Integer>> allUsers = new ArrayList<>();
        ArrayList<Integer> weights = new ArrayList<>();
        for (String s: allCond) {
            ArrayList<Integer> lst = getExactMatch(s, user.getCond(s));
            if (lst != null) {
                allUsers.add(lst);
                if (s.equals("location")) {
                    weights.add(100);
                } else if (s.equals("gender")) {
                    weights.add(10);
                } else {
                    weights.add(1);
                }
            }
        }
        rank(allUsers, weights);
        populateInfo();
        ArrayList<User> retList = new ArrayList<>();
        ArrayList<Integer> retUserID = new ArrayList<>();
        for (User u: rankedMatches) {
            if (u.getId() != user.getId() && !retUserID.contains(u.getId())) {
                retList.add(u);
                retUserID.add(u.getId());
            }
        }
        return retList;
    }

    private void rank(ArrayList<ArrayList<Integer>> allUsers, ArrayList<Integer> weights) {
        ArrayList<Integer> checkedID = new ArrayList<>();
        rankedMatches.clear();
        System.out.println("Ranking " + allUsers.size() + " sets");
        for (int i = 0; i < allUsers.size(); i++) {
            if (allUsers.get(i).isEmpty()) continue;
            for (int id : allUsers.get(i)) {
                User newPerson = new User(id, weights.get(i));
                System.out.println("User id: " + id);
                checkedID.add(id);
                for (int j = i + 1; j < allUsers.size(); j ++) {
                    System.out.println("j " + j);
                    if (allUsers.get(j).contains(id) && !checkedID.contains(id)) {
                        newPerson.addScore(weights.get(j));
//                        allUsers.get(j).remove(id);
                    }
                }
                rankedMatches.add(newPerson);
            }
        }
        System.out.println("Setting!");
        rankedMatches.sort(Comparator.comparingInt(User::getCompatibilityScore));
    }

    private void populateInfo() {
        try {
            String query = "select * from user where id = ?";
            PreparedStatement ps = this.con.prepareStatement(query);
            for (User u: rankedMatches) {
                ps.setString(1, u.getId() + "");

                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String avatar = rs.getString("img_avatar");
                    String location = rs.getString("location");
                    u.setName(name);
                    u.setEmail(email);
                    u.setAvatar(avatar);
                    u.setLocation(location);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
