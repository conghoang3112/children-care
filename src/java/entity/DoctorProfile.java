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
public class DoctorProfile {

    private int id;
    private Doctor doctor;
    private String firstName;
    private String lastName;
    private Date dob;
    private String avatar;
    private boolean sex;
    private String addressHospital;
    private String email;
    private String phone;
    private int experience;

    public DoctorProfile() {
    }

    public DoctorProfile(int id, Doctor doctor, String firstName, String lastName, Date dob, String avatar, boolean sex, String addressHospital) {
        this.id = id;
        this.doctor = doctor;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dob = dob;
        this.avatar = avatar;
        this.sex = sex;
        this.addressHospital = addressHospital;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getAddressHospital() {
        return addressHospital;
    }

    public void setAddressHospital(String addressHospital) {
        this.addressHospital = addressHospital;
    }

}
