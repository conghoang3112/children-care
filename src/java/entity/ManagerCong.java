/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author congh
 */
public class ManagerCong {
    private int managerId;
    private int accId;
    private int serviceId;
    private String firstName;
    private String lastname;
    private long phone;
    private String avata;

    public ManagerCong() {
    }

    public ManagerCong(int managerId, int accId, int serviceId, String firstName, String lastname, long phone, String avata) {
        this.managerId = managerId;
        this.accId = accId;
        this.serviceId = serviceId;
        this.firstName = firstName;
        this.lastname = lastname;
        this.phone = phone;
        this.avata = avata;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getAvata() {
        return avata;
    }

    public void setAvata(String avata) {
        this.avata = avata;
    }

    @Override
    public String toString() {
        return "ManagerCong{" + "managerId=" + managerId + ", accId=" + accId + ", serviceId=" + serviceId + ", firstName=" + firstName + ", lastname=" + lastname + ", phone=" + phone + ", avata=" + avata + '}';
    }

    
    
}
