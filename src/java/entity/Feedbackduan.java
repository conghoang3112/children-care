/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author duan1
 */
public class Feedbackduan {
    private int id;
    private String content;
    private Date time;
    private Reservation reservation;
    private User user;

    public Feedbackduan() {
    }

    public Feedbackduan(int id, String content, Date time, Reservation reservation, User user) {
        this.id = id;
        this.content = content;
        this.time = time;
        this.reservation = reservation;
        this.user = user;
    }

    public Feedbackduan(int id) {
        this.id = id;
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

    public Reservation getReservation() {
        return reservation;
    }

    public void setReservation(Reservation reservation) {
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
        return "Feedbackduan{" + "id=" + id + ", content=" + content + ", time=" + time + ", reservation=" + reservation + ", user=" + user + '}';
    }
    
}
