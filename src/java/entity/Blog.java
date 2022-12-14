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
public class Blog {

    private int id;
    private Manager manager;
    private String content;
    private Date time;
    private Date timeRead;
    private int heart;
    private int comment;
    private String title;
    private String titleImage;

    public Blog() {
    }

    public Blog(int id, Manager manager, String content, Date time) {
        this.id = id;
        this.manager = manager;
        this.content = content;
        this.time = time;
    }

    public Blog(int blogId, Manager manager, String content, Date time, Date timeRead, int heart, int comment, String title, String titleImage) {
        this.id = blogId;
        this.content = content;
        this.time = time;
        this.timeRead = timeRead;
        this.heart = heart;
        this.comment = comment;
        this.title = title;
        this.titleImage = titleImage;
        this.manager = manager;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
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

    public Date getTimeRead() {
        return timeRead;
    }

    public void setTimeRead(Date timeRead) {
        this.timeRead = timeRead;
    }

    public int getHeart() {
        return heart;
    }

    public void setHeart(int heart) {
        this.heart = heart;
    }

    public int getComment() {
        return comment;
    }

    public void setComment(int comment) {
        this.comment = comment;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }
}
