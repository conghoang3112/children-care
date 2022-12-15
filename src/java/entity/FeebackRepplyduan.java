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
public class FeebackRepplyduan {
     private int id;
    private Feedback feedback;
    private User user;
    private String content;
    private Date time;

    public FeebackRepplyduan() {
    }

    public FeebackRepplyduan(int id) {
        this.id = id;
    }

    public FeebackRepplyduan(int id, Feedback feedback, User user, String content, Date time) {
        this.id = id;
        this.feedback = feedback;
        this.user = user;
        this.content = content;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    @Override
    public String toString() {
        return "FeebackRepplyduan{" + "id=" + id + ", feedback=" + feedback + ", user=" + user + ", content=" + content + ", time=" + time + '}';
    }
    
}
