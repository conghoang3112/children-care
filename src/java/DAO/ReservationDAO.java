/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import context.DBContext;
import entity.Doctor;
import entity.MedicalRecord;
import entity.Patient;
import entity.Reservation;
import entity.TimeSlot;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class ReservationDAO extends DBContext {

    public static int getTotalReservation() {
        
        try {
            String sql = "SELECT COUNT(r.[reservation_id])\n"
                    + "FROM [Reservation] r \n"
                    + "JOIN [Doctor] d ON r.doctor_id = d.doctor_id  \n"
                    + "JOIN [TimeSlot] t ON r.[time_slot_id] = t.[slot_id]    \n"
                    + "JOIN [DoctorProfile] df ON r.[doctor_id] = d.[doctor_id]    \n"
                    + "JOIN [User] u ON r.[user_id] = u.[user_id]";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Reservation> getAll() {
        List<Reservation> reservationsList = new ArrayList<>();
        try {
            String sql = "SELECT r.[reservation_id]  \n"
                    + "    ,[time_slot_id]    \n"
                    + "    ,t.[slot_time]    \n"
                    + "    ,r.[doctor_id]\n"
                    + "	,df.[first_name] AS [dfirst_name]\n"
                    + "	,df.[last_name] AS [dlast_name]\n"
                    + "    ,[date_booking]    \n"
                    + "    ,[phone_contact]    \n"
                    + "    ,[status]    \n"
                    + "    ,[issue]    \n"
                    + "    ,r.[user_id]    \n"
                    + "    ,u.[first_name] AS [ufirst_name]    \n"
                    + "    ,u.[last_name] AS [ulast_name]    \n"
                    + "    ,[patient_id]    \n"
                    + "FROM [Reservation] r    \n"
                    + "JOIN [Doctor] d ON r.doctor_id = d.doctor_id  \n"
                    + "JOIN [TimeSlot] t ON r.[time_slot_id] = t.[slot_id]    \n"
                    + "JOIN [DoctorProfile] df ON r.[doctor_id] = d.[doctor_id]    \n"
                    + "JOIN [User] u ON r.[user_id] = u.[user_id]";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                reservationsList.add(new Reservation(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13)));
            }
        } catch (Exception ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return reservationsList;
    }

    public List<Reservation> getReservationWithPagging(int page, int PAGE_SIZE) {
        List<Reservation> list = new ArrayList<>();
        try {
            String sql = "SELECT r.[reservation_id]  \n"
                    + "    ,[time_slot_id]    \n"
                    + "    ,t.[slot_time]    \n"
                    + "    ,r.[doctor_id]\n"
                    + "	,df.[first_name] AS [dfirst_name]\n"
                    + "	,df.[last_name] AS [dlast_name]\n"
                    + "    ,[date_booking]    \n"
                    + "    ,[phone_contact]    \n"
                    + "    ,[status]    \n"
                    + "    ,[issue]    \n"
                    + "    ,r.[user_id]    \n"
                    + "    ,u.[first_name] AS [ufirst_name]    \n"
                    + "    ,u.[last_name] AS [ulast_name]    \n"
                    + "    ,[patient_id]    \n"
                    + "FROM [Reservation] r \n"
                    + "JOIN [Doctor] d ON r.doctor_id = d.doctor_id  \n"
                    + "JOIN [TimeSlot] t ON r.[time_slot_id] = t.[slot_id]    \n"
                    + "JOIN [DoctorProfile] df ON r.[doctor_id] = d.[doctor_id]    \n"
                    + "JOIN [User] u ON r.[user_id] = u.[user_id]\n"
                    + "ORDER BY r.[reservation_id]\n"
                    + "offset (?-1)*? row fetch next ? rows only";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Reservation(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getInt(11),
                        rs.getString(12),
                        rs.getString(13)));
            }
        } catch (Exception ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
