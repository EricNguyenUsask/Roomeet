package com.tinder.websocket.server;


import com.tinder.bean.RoomChat;
import com.tinder.dao.UserDatabase;
import com.tinder.util.ConnectionPro;

import javax.json.JsonObject;
import javax.json.spi.JsonProvider;
import javax.websocket.Session;
import java.io.IOException;
import java.util.*;

public class MessageSessionHandler {
    private int roomId = 0;
    static Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());
    static final Set<RoomChat> rooms = Collections.synchronizedSet(new HashSet<>());
    ArrayList<Integer> room_ids = new ArrayList<Integer>();

    public void addSession(Session session) throws IOException {
        sessions.add(session);
    }

    public void removeSession(Session session, Integer us_id) throws IOException {
        sessions.remove(session);
        Integer rm_id = null;
        StringBuffer listUser = new StringBuffer();
        for(RoomChat rm : rooms){
            if(rm.getUserId() == us_id) {
                rm_id = rm.getRoomId();
                rooms.remove(rm);
            }else {
                if(rooms.size() > 0){
                    listUser.append(rm.getUserName() + " \n");
                }
            }
        }
        if(listUser.toString() != null) {
            JsonProvider provider = JsonProvider.provider();
            JsonObject removeObj = provider.createObjectBuilder()
                    .add("action", "remove")
                    .add("list_active", listUser.toString())
                    .add("room_id",  rm_id)
                    .build();
            for (Session user : sessions) {
                user.getBasicRemote().sendText(removeObj.toString());
            }
        }
    }

    public void sendListUserOnline(RoomChat room) throws IOException {
        StringBuffer listUser = new StringBuffer();
        for (RoomChat rm : rooms) {
            if(rm.getRoomId() == room.getRoomId() ) {
                listUser.append(rm.getUserName() + " \n");
            }
        }
        buildListUser(room, listUser);
    }

    public void buildListUser(RoomChat room, StringBuffer listUser) throws IOException {
        JsonProvider provider = JsonProvider.provider();
        JsonObject initObj = provider.createObjectBuilder()
                .add("action", "init")
                .add("user_id", room.getUserId())
                .add("room_id", room.getRoomId())
                .add("user_name", room.getUserName())
                .add("list_active", listUser.toString())
                .build();
        for (Session user : sessions) {
            user.getBasicRemote().sendText(initObj.toString());
        }
    }

    public List<RoomChat> getDevices() {
        return new ArrayList<>(rooms);
    }

    public void initRoomChat(RoomChat room) throws IOException {
        room.setId(roomId);
        rooms.add(room);
        roomId++;
        sendListUserOnline(room); // send all users in session server chat
    }

    public void addRoomChat(RoomChat room) throws IOException {
        room.setId(roomId);
        roomId++;
        RoomChat chat = new RoomChat(room.getUserId(), room.getRoomId(), room.getUserName(), room.getMessage()); // gán vô class User
        UserDatabase addChat = new UserDatabase(ConnectionPro.getConnection());
        addChat.saveChat(chat);
        JsonObject addMessage = createAddMessage(room);
        sendToAllConnectedSessions(addMessage);
    }
    public void removeRoomChat(Integer us_id, Integer rm_id) throws IOException {
        StringBuffer listUser = new StringBuffer();
        for(RoomChat rm : rooms){
            if(rm.getRoomId() == rm_id && rm.getUserId() == us_id) {
                rooms.remove(rm);
            }else {
                if(rm.getRoomId() == rm_id) {
                    listUser.append(rm.getUserName() + " \n");
                }
            }
        }
        // send list active
        JsonProvider provider = JsonProvider.provider();
        JsonObject removeObj = provider.createObjectBuilder()
                .add("action", "remove")
                .add("list_active", listUser.toString())
                .add("room_id",  rm_id)
                .build();
        for (Session user : sessions) {
            System.out.println(user + "test");
            user.getBasicRemote().sendText(removeObj.toString());
        }
    }


    private JsonObject createAddMessage(RoomChat room) {
        JsonProvider provider = JsonProvider.provider();
        JsonObject addMessage = provider.createObjectBuilder()
                .add("action", "add")
                .add("id", room.getId())
                .add("user_id", room.getUserId())
                .add("room_id", room.getRoomId())
                .add("status", "on")
                .add("message", room.getMessage())
                .add("user_name", room.getUserName())
                .build();
        return addMessage;
    }

    private void sendToAllConnectedSessions(JsonObject mess) throws IOException {

        for (Session user : sessions) {
            user.getBasicRemote().sendText(mess.toString());
        }
    }
}
