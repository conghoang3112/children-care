/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.DoctorCONG;
import entity.ManagerCong;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author congh
 */
public class CongDoctorDAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<DoctorCONG> getAllDoctor() {
        List<DoctorCONG> list = new ArrayList<>();
        String query = "select * from DoctorProfile";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DoctorCONG(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getBoolean(7),
                        rs.getString(8)));
            }
        } catch (Exception e) {
            
        }
        return list;
    }
    public static void main(String[] args) {
        CongDoctorDAO dao = new CongDoctorDAO();
        List<DoctorCONG> a = dao.getAllDoctor();
        System.out.println(a);
    }
}
