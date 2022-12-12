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
public class Doctor {

    private int id;
    private Account account;
    private Specialist specialist;
    private DoctorProfile doctorProfile;

    public Doctor() {
    }

    public Doctor(int id) {
        this.id = id;
    }

    public Doctor(int id, Account account, Specialist specialist) {
        this.id = id;
        this.account = account;
        this.specialist = specialist;
    }

    public DoctorProfile getDoctorProfile() {
        return doctorProfile;
    }

    public void setDoctorProfile(DoctorProfile doctorProfile) {
        this.doctorProfile = doctorProfile;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Specialist getSpecialist() {
        return specialist;
    }

    public void setSpecialist(Specialist specialist) {
        this.specialist = specialist;
    }

    @Override
    public String toString() {
        return "Doctor{" + "id=" + id + ", account=" + account + ", specialist=" + specialist + ", doctorProfile=" + doctorProfile + '}';
    }

}
