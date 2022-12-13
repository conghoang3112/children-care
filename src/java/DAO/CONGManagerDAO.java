/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.ManagerCong;
import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author congh
 */
public class CONGManagerDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<ManagerCong> getAllManager() {
        List<ManagerCong> list = new ArrayList<>();
        String query = "select * from Manager";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ManagerCong(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getLong(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public static void main(String[] args) {
        CONGManagerDAO dao = new CONGManagerDAO();
        List<ManagerCong> c = dao.getAllManager();
        System.out.println(c);
    }
}
