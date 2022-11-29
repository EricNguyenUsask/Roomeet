package com.tinder.websocket.server;


import com.tinder.bean.RoomChat;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;

@ServerEndpoint(value = "/room/{user-id}")
public class RoomServerEndpoint {

    public MessageSessionHandler sessionHandler = new MessageSessionHandler();

    @OnOpen
    public void open(Session session, @PathParam("user-id") String user_id) throws IOException {
        sessionHandler.addSession(session);
    }
    @OnMessage
    public void handleMessage(String message, Session session) throws IOException {
        try (JsonReader reader = Json.createReader(new StringReader(message))) {
            JsonObject jsonMessage = reader.readObject();

            if ("init".equals(jsonMessage.getString("action"))) {
                RoomChat room = new RoomChat();
                room.setRoomId(jsonMessage.getInt("room_id"));
                room.setUserId(jsonMessage.getInt("user_id"));
                room.setUserName(jsonMessage.getString("user_name"));
                sessionHandler.initRoomChat(room);
            }

            if ("add".equals(jsonMessage.getString("action"))) {
                RoomChat room = new RoomChat();
                room.setRoomId(jsonMessage.getInt("room_id"));
                room.setUserId(jsonMessage.getInt("user_id"));
                room.setUserName(jsonMessage.getString("user_name"));
                room.setMessage(jsonMessage.getString("message"));
                sessionHandler.addRoomChat(room);
            }
        }
    }

    @OnClose
    public void close(Session session, @PathParam("user-id") Integer user_id) throws IOException {
        sessionHandler.removeSession(session, user_id);
    }

    @OnError
    public void onError(Throwable error) {
        Logger.getLogger(RoomServerEndpoint.class.getName()).log(Level.SEVERE, null, error);
    }
}
