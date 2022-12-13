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
public class Reservation {

    private int id;
    private int time_slot_id;
    private String slot_time;
    private int doctor_id;
    private String dfirst_name;
    private String dlast_name;
    private Date dateBooking;
    private String phoneContact;
    private String status;
    private String issue;
    private int user_id;
    private String ufirst_name;
    private String ulast_name;

    public Reservation() {
    }

    public Reservation(int id, int time_slot_id, String slot_time, int doctor_id, String dfirst_name, String dlast_name, Date dateBooking, String phoneContact, String status, String issue, int user_id, String ufirst_name, String ulast_name) {
        this.id = id;
        this.time_slot_id = time_slot_id;
        this.slot_time = slot_time;
        this.doctor_id = doctor_id;
        this.dfirst_name = dfirst_name;
        this.dlast_name = dlast_name;
        this.dateBooking = dateBooking;
        this.phoneContact = phoneContact;
        this.status = status;
        this.issue = issue;
        this.user_id = user_id;
        this.ufirst_name = ufirst_name;
        this.ulast_name = ulast_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTime_slot_id() {
        return time_slot_id;
    }

    public void setTime_slot_id(int time_slot_id) {
        this.time_slot_id = time_slot_id;
    }

    public String getSlot_time() {
        return slot_time;
    }

    public void setSlot_time(String slot_time) {
        this.slot_time = slot_time;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getDfirst_name() {
        return dfirst_name;
    }

    public void setDfirst_name(String dfirst_name) {
        this.dfirst_name = dfirst_name;
    }

    public String getDlast_name() {
        return dlast_name;
    }

    public void setDlast_name(String dlast_name) {
        this.dlast_name = dlast_name;
    }

    public Date getDateBooking() {
        return dateBooking;
    }

    public void setDateBooking(Date dateBooking) {
        this.dateBooking = dateBooking;
    }

    public String getPhoneContact() {
        return phoneContact;
    }

    public void setPhoneContact(String phoneContact) {
        this.phoneContact = phoneContact;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIssue() {
        return issue;
    }

    public void setIssue(String issue) {
        this.issue = issue;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUfirst_name() {
        return ufirst_name;
    }

    public void setUfirst_name(String ufirst_name) {
        this.ufirst_name = ufirst_name;
    }

    public String getUlast_name() {
        return ulast_name;
    }

    public void setUlast_name(String ulast_name) {
        this.ulast_name = ulast_name;
    }

    @Override
    public String toString() {
        return "Reservation{" + "id=" + id + ", time_slot_id=" + time_slot_id + ", slot_time=" + slot_time + ", doctor_id=" + doctor_id + ", dfirst_name=" + dfirst_name + ", dlast_name=" + dlast_name + ", dateBooking=" + dateBooking + ", phoneContact=" + phoneContact + ", status=" + status + ", issue=" + issue + ", user_id=" + user_id + ", ufirst_name=" + ufirst_name + ", ulast_name=" + ulast_name + '}';
    }
    
    

   
}
