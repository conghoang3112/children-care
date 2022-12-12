/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import context.DBContext;
import entity.Docter1;
import entity.Doctor;
import entity.Reservation;
import entity.TimeSlot;
import entity.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author duan1
 */
public class ReservationIplm  implements ReservationDAO{
    public static void main(String[] args) {
        ReservationDAO dao = new ReservationIplm();
        List<Reservation> list = dao.getALlReservationbyUid(12);
        int count =1;
        
        for (Reservation re : list) {
            System.out.println(re+"\n");
            System.out.println(count++);
            
        }
//        String date = "2022-12-19";
//        Date date1= java.sql.Date.valueOf(date);
//        
//        Reservation res = new Reservation(0,new TimeSlot(1, "aa"), new Doctor(1),date1, "123456789", "REQUSET", "ISUE",new User(12));
//        dao.addReservation(res);
        
    }
    @Override
    public boolean addReservation(Reservation res) {
        boolean flag =false;
        try {
            Connection conn = new DBContext().getConnection();
            String sql="Insert into Reservation values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, res.getTimeSlot().getId());
            ps.setInt(2, res.getDoctor().getId());
            ps.setDate(3, (Date) res.getDateBooking());
            ps.setString(4, res.getPhoneContact());
            ps.setString(5, res.getStatus());
            ps.setString(6, res.getIssue());
            ps.setInt(7, res.getUser().getId());
            ps.setNull(8,0);
            flag=ps.execute();
        } catch (Exception ex) {
            Logger.getLogger(ReservationIplm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

   
    @Override
    public Reservation getResReservationbyId(int ReId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Reservation> getAllRes() {
        List<Reservation> list = new ArrayList<>();
        
        
        try {
             Connection con =new DBContext().getConnection();
            String sql="SELECT  [reservation_id]\n" +
"      ,[time_slot_id]\n" +
"      ,[doctor_id]\n" +
"      ,[date_booking]\n" +
"      ,[phone_contact]\n" +
"      ,[status]\n" +
"      ,[issue]\n" +
"      ,[user_id]\n" +
"      ,[patient_id]\n" +
"  FROM [ChildrenCare].[dbo].[Reservation]SELECT TOP (1000) [reservation_id]\n" +
"      ,[time_slot_id]\n" +
"      ,[doctor_id]\n" +
"      ,[date_booking]\n" +
"      ,[phone_contact]\n" +
"      ,[status]\n" +
"      ,[issue]\n" +
"      ,[user_id]\n" +
"      ,[patient_id]\n" +
"  FROM [ChildrenCare].[dbo].[Reservation]";
            Statement st = con.createStatement();
            ResultSet rs= st.executeQuery(sql);
            while(rs.next()){
                
                list.add(new Reservation(rs.getInt(1),new TimeSlot(rs.getInt(2)), new Doctor(rs.getInt(3)),rs.getDate(4) , rs.getString(5),rs.getString(6),rs.getString(7),new User(rs.getInt(8))));
            }
            
           
        } catch (Exception ex) {
            Logger.getLogger(ReservationIplm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    @Override
    public List<Reservation> getALlReservationbyUid(int UserId) {
     List<Reservation> list1 = new ArrayList<>();
        
        
        try {
             Connection con =new DBContext().getConnection();
            String sql="SELECT  [reservation_id]\n" +
"		  ,[time_slot_id]\n" +
"		  ,[doctor_id]\n" +
"		  ,[date_booking]\n" +
"		  ,[phone_contact]\n" +
"		  ,[status]\n" +
"		  ,[issue]\n" +
"		  ,[user_id]\n" +
"		  ,[patient_id]\n" +
"	  FROM [ChildrenCare].[dbo].[Reservation]  where [user_id] = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                
                list1.add(new Reservation(rs.getInt(1),new TimeSlot(rs.getInt(2)), new Doctor(rs.getInt(3)),rs.getDate(4) , rs.getString(5),rs.getString(6),rs.getString(7),new User(rs.getInt(8))));
            }
            
           
        } catch (Exception ex) {
            Logger.getLogger(ReservationIplm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list1;
    }

    @Override
    public List<Reservation> getListViewReservationbyUid(int UserId) {
List<Reservation> listv = new ArrayList<>();
        
        
        try {
             Connection con =new DBContext().getConnection();
            String sql="select p.first_name,p.last_name,r.date_booking,t.slot_time,r.[status] from  DoctorProfile p ,Doctor d ,Reservation r,TimeSlot t \n" +
"where p.profile_id=d.profile_id and d.doctor_id=r.doctor_id and r.time_slot_id =t.slot_id  and r.[user_id]=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                
                listv.add(new Reservation(rs.getInt(1),new TimeSlot(rs.getInt(2)), new Doctor(rs.getInt(3)),rs.getDate(4) , rs.getString(5),rs.getString(6),rs.getString(7),new User(rs.getInt(8))));
            }
            
           
        } catch (Exception ex) {
            Logger.getLogger(ReservationIplm.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listv;
    }
    
}
