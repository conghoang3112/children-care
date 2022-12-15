/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Feedback {
    private int id;
    private String content;
    private Date time;
    private Reservationduan reservation;
    private User user;

    public Feedback() {
    }

    public Feedback(int id) {
        this.id = id;
    }
     

    public Feedback(int id, String content, Date time, Reservationduan reservation, User user) {
        this.id = id;
        this.content = content;
        this.time = time;
        this.reservation = reservation;
        this.user = user;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Reservationduan getReservation() {
        return reservation;
    }

    public void setReservation(Reservationduan reservation) {
        this.reservation = reservation;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", content=" + content + ", time=" + time + ", reservation=" + reservation + ", user=" + user + '}';
    }
    
}
