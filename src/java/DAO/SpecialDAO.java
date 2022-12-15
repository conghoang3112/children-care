/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.Account;
import entity.Doctor;
import entity.DoctorProfile;
import entity.Room;
import entity.Specialist;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author duan1
 */
public class SpecialDAO {

    public static void main(String[] args) throws Exception {
        SpecialDAO sp = new SpecialDAO();
        List<Specialist> list = sp.getAllSpecial();
        List<Doctor> dlist = sp.getAlldoctobysIid(1);
        for (Doctor doctor : dlist) {
            System.out.println(doctor.getDoctorProfile());
            System.out.println(doctor.getRoomid().getRoomMeet());
            System.out.println(doctor.getSpecialist().getName());
            System.out.println("-------------------------------");

        }

    }

    public List<Specialist> getAllSpecial() throws Exception {
        List<Specialist> slist = new ArrayList<>();
        Connection con = new DBContext().getConnection();
        String sql = "Select * From Specialist";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            slist.add(new Specialist(rs.getInt(1), rs.getString(2)));
        }
        return slist;

    }

    public List<Doctor> getAlldoctobysIid(int id) throws Exception {
        List<Doctor> dlist = new ArrayList<>();
        Connection con = new DBContext().getConnection();
        String sql = "  Select d.doctor_id,d.specialist_id,s.specialist_name,d.profile_id,p.first_name,p.last_name ,d.room_id,r.room_meet\n"
                + "  from Doctor d , DoctorProfile p ,Specialist s,Room r \n"
                + "  where d.profile_id = p.profile_id  and d.specialist_id = s.specialist_id and d.room_id=r.room_id and s.specialist_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            dlist.add(new Doctor(rs.getInt(1), new Account(), new Specialist(rs.getInt(2), rs.getString(3)), new DoctorProfile(rs.getInt(4), rs.getString(5), rs.getString(6)), new Room(rs.getInt(7), rs.getString(8))));
        }
        return dlist;
    }
    
     public List<Doctor> getAlldoctor(int id) throws Exception {
        List<Doctor> dlist = new ArrayList<>();
        Connection con = new DBContext().getConnection();
        String sql = "  Select d.doctor_id,d.specialist_id,s.specialist_name,d.profile_id,p.first_name,p.last_name ,d.room_id,r.room_meet\n"
                + "  from Doctor d , DoctorProfile p ,Specialist s,Room r \n"
                + "  where d.profile_id = p.profile_id  and d.specialist_id = s.specialist_id and d.room_id=r.room_id";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            dlist.add(new Doctor(rs.getInt(1), new Account(), new Specialist(rs.getInt(2), rs.getString(3)), new DoctorProfile(rs.getInt(4), rs.getString(5), rs.getString(6)), new Room(rs.getInt(7), rs.getString(8))));
        }
        return dlist;
    }
}
