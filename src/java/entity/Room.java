/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class Room {

    private int id;
    private String roomMeet;
    

    public Room() {
    }

    public Room(int id, String roomMeet) {
        this.id = id;
        this.roomMeet = roomMeet;
       
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomMeet() {
        return roomMeet;
    }

    public void setRoomMeet(String roomMeet) {
        this.roomMeet = roomMeet;
    }

    @Override
    public String toString() {
        return "Room{" + "id=" + id + ", roomMeet=" + roomMeet + '}';
    }

    

}
