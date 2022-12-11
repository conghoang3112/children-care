/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author congh
 */
public class AccountDAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public Account checkLogin(String userName, String userPassword) {
        String query = "select * from Account\n"
                + "where [username] = ? and password = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, userPassword);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        Account a = dao.checkLogin("admin1", "123");
        System.out.println(a);
    }
}
