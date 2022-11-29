package com.tinder.bean;

import java.util.ArrayList;

public class User {
    int id;
    String name;
    String email;
    String password;
    String firstname;
    String lastname;
    String avatar;
    String location;
    String pronoun;
    String gender;
    String personality;
    String zodiac;
    String smoking;
    String pet;
    String comment;
    String groupName;
    int room_id;
    int compatibilityScore;
    int budget;
    String dob;
    String room_name;

    public User() {
        compatibilityScore = 0;
    }

    public User(int id, String name, String email, String password, String firstname, String lastname,String location, String pronoun, String gender, String personality, String zodiac,String smoking, String pet, String comment, Integer budget, String dob) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.location = location;
        this.pronoun = pronoun;
        this.gender = gender;
        this.personality = personality;
        this.zodiac = zodiac;
        this.smoking = smoking;
        this.pet=pet;
        this.comment = comment;
        compatibilityScore = 0;
        this.budget= budget;
        this.dob = dob;
    }

    public User (String name, String email, String password, String firstname, String lastname) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        compatibilityScore = 0;
    }
    public User (Integer id, String name, String email, String avatar, String location) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.avatar = avatar;
        this.location = location;
    }

    public User (String name, String email, String avatar, String location, String dob, String lastname, String pronoun, Integer id) {
        this.name = name;
        this.email = email;
        this.avatar = avatar;
        this.location = location;
        this.dob = dob;
        this.lastname=lastname;
        this.pronoun=pronoun;
        this.id =id;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public User(String avatar, String name, String email) {
        this.email = email;
        this.name = name;
        this.avatar = avatar;
    }

    public User (int id, int score) {
        this.id = id;
        this.compatibilityScore = score;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstname;
    }

    public void setFirstName(String firstname) {
        this.firstname = firstname;
    }

    public String getLastName() {
        return lastname;
    }

    public void setLastName(String lastname) {
        this.lastname = lastname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getLocation() {
        return location;
    }


    public void setLocation(String location) {
        this.location = location;} //

    public String getPronoun() {
        return pronoun;
    }

    public void setPronoun(String pronoun) {
        this.pronoun = pronoun;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getPersonality() {
        return personality;
    }

    public void setPersonality(String personality) {
        this.personality = personality;
    }
    public String getZodiac() {
        return zodiac;
    }

    public void setZodiac(String zodiac) {
        this.zodiac = zodiac;
    }
    public String getSmoking() {
        return smoking;
    }

    public void setSmoking(String smoking) {
        this.smoking = smoking;
    }

    public String getPet() {
        return pet;
    }

    public void setPet(String pet) {
        this.pet = pet;
    }
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getGroupName(){
        return groupName;
    }

    public void setGroupName(String groupName){
        this.groupName = groupName;
    }
    public int getRoomId() {
        return room_id;
    }

    public void setRoomId(int room_id) {
        this.room_id = room_id;
    }
    public int getBudget() {
        return budget;
    }

    public void setBudget(Integer budget) {
        this.budget = budget;
    }
    public String getDob(){
        return dob ;
    }

    public void setDob(String dob){
        this.dob = dob;
    }


    public void addScore(int score) {
        this.compatibilityScore += score;
    }

    public int getCompatibilityScore() {
        return -compatibilityScore;
    }

    public void setScore(int score) {
        this.compatibilityScore = score;
    }

    public void setRoomName(String room_name) {
        this.room_name = room_name;
    }

    public String getRoomName() {
        return room_name;
    }

    public ArrayList<String> getCriteriaList() {
        ArrayList<String> list = new ArrayList<>();
        list.add("gender");
        list.add("location");
        list.add("pet");
        list.add("personality");
        list.add("smoking");
        return list;
    }

    public String getCond(String crit) {
        switch (crit) {
            case "location":
                return this.location;
            case "pet":
                return this.pet;
            case "gender":
                return this.gender;
            case "personality":
                return this.personality;
            case "smoking":
                return this.smoking;
            default:
                return null;
        }
    }



}