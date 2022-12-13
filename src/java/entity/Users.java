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
public class Users {
    private int userId;
    private String firstName;
    private String LastName;
    private long phone;
    private String address;
    private String avata;
    private boolean sex;
    private int AccId;

    public Users() {
    }

    public Users(int userId, String firstName, String LastName, long phone, String address, String avata, boolean sex, int AccId) {
        this.userId = userId;
        this.firstName = firstName;
        this.LastName = LastName;
        this.phone = phone;
        this.address = address;
        this.avata = avata;
        this.sex = sex;
        this.AccId = AccId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvata() {
        return avata;
    }

    public void setAvata(String avata) {
        this.avata = avata;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public int getAccId() {
        return AccId;
    }

    public void setAccId(int AccId) {
        this.AccId = AccId;
    }

    @Override
    public String toString() {
        return "Users{" + "userId=" + userId + ", firstName=" + firstName + ", LastName=" + LastName + ", phone=" + phone + ", address=" + address + ", avata=" + avata + ", sex=" + sex + ", AccId=" + AccId + '}';
    }

    

    
    
    
}
