/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author congh
 */
public class DoctorCONG {
    private int profile_id;
    private int doctor_id;
    private String first_name;
    private String last_name;
    private Date dob;
    private String avatar;
    private boolean sex;
    private String address_hospital;

    public DoctorCONG() {
    }

    public DoctorCONG(int profile_id, int doctor_id, String first_name, String last_name, Date dob, String avatar, boolean sex, String address_hospital) {
        this.profile_id = profile_id;
        this.doctor_id = doctor_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.dob = dob;
        this.avatar = avatar;
        this.sex = sex;
        this.address_hospital = address_hospital;
    }

    public int getProfile_id() {
        return profile_id;
    }

    public void setProfile_id(int profile_id) {
        this.profile_id = profile_id;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public String getAddress_hospital() {
        return address_hospital;
    }

    public void setAddress_hospital(String address_hospital) {
        this.address_hospital = address_hospital;
    }

    @Override
    public String toString() {
        return "CongDoctorDAO{" + "profile_id=" + profile_id + ", doctor_id=" + doctor_id + ", first_name=" + first_name + ", last_name=" + last_name + ", dob=" + dob + ", avatar=" + avatar + ", sex=" + sex + ", address_hospital=" + address_hospital + '}';
    }
}
