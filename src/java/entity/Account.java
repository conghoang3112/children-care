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
public class Account {
    private int acc_id;
    private String username;
    private String password;
    private String email;
    private int roleId;

    public Account() {
    }

    public Account(int acc_id, String username, String password, String email, int roleId) {
        this.acc_id = acc_id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.roleId = roleId;
    }


    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
        this.acc_id = acc_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "Account{" + "acc_id=" + acc_id + ", username=" + username + ", password=" + password + ", email=" + email + ", roleId=" + roleId + '}';
    }
    
    
}
