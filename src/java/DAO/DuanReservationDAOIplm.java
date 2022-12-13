/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.Doctor;
import entity.DoctorProfile;
import entity.Reservation;
import entity.Reservationduan;
import entity.TimeSlot;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author duan1
 */
public class DuanReservationDAOIplm implements DuanReservationDAO{
    public static void main(String[] args) {
    DuanReservationDAO dao = new DuanReservationDAOIplm();
    Reservationduan re = dao.getReservationDetail(12, 1);
        System.out.println(re);
    }
    @Override
    public Reservationduan getReservationDetail(int uid, int rid) {
        Reservationduan re = null ;
        try {
         String Sql = "select r.reservation_id ,p.first_name,p.last_name,r.date_booking,t.slot_time,r.[status],r.issue,r.phone_contact from  DoctorProfile p ,Doctor d ,Reservation r,TimeSlot t\n" +
"where p.profile_id=d.profile_id and d.doctor_id=r.doctor_id and r.time_slot_id =t.slot_id  and r.[user_id]=? and r.reservation_id =?";
            Connection con = new DBContext().getConnection();
            PreparedStatement ps= con.prepareStatement(Sql);
            ps.setInt(1, uid);
            ps.setInt(2, rid);
            ResultSet rs= ps.executeQuery();
            while(rs.next()){
                
                 re=new Reservationduan(rs.getInt(1), new TimeSlot(0,rs.getString(5)),new Doctor(new DoctorProfile(rs.getString(2),rs.getString(3))),rs.getDate(4), rs.getString(8), rs.getString(6), rs.getString(7), new User(uid));
                 
            }
        } catch (Exception ex) {
            Logger.getLogger(DuanReservationDAOIplm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return re;
        
       
    }
    
    
}
