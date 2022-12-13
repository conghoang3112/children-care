/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.Reservation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author duan1
 */
public class DuanReservationDAOIplm implements DuanReservationDAO{

    @Override
    public Reservation getReservationDetail(int uid, int rid) {
        Reservation re = null ;
        try {
         String Sql = "select p.first_name,p.last_name,r.date_booking,t.slot_time,r.[status],r.reservation_id from  DoctorProfile p ,Doctor d ,Reservation r,TimeSlot t\n" +
"where p.profile_id=d.profile_id and d.doctor_id=r.doctor_id and r.time_slot_id =t.slot_id  and r.[user_id]=? and r.reservation_id =?";
            Connection con = new DBContext().getConnection();
            PreparedStatement ps= con.prepareStatement(Sql);
            ps.setInt(1, uid);
            ps.setInt(2, rid);
            ResultSet rs= ps.executeQuery();
            while(rs.next()){
               
            }
        } catch (Exception ex) {
            Logger.getLogger(DuanReservationDAOIplm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return re;
        
       
    }
    
    
}
