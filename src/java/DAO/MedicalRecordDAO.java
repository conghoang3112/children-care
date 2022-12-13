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
 * @author admin
 */
public class MedicalRecordDAO {

    public List<MedicalRecord> getAllMedicalRecord() {
        List<MedicalRecord> list = new ArrayList<>();
        try {
            String sql = "SELECT [record_id]\n"
                    + "      ,[reservation_id]\n"
                    + "      ,[diease_name]\n"
                    + "      ,[prescription]\n"
                    + "      ,[record_note]\n"
                    + "  FROM [dbo].[MedicalRecord]";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new MedicalRecord(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void create(MedicalRecord medicalRecord) {

        try {
            String sql = "INSERT INTO [MedicalRecord]\n"
                    + "           ([reservation_id]\n"
                    + "           ,[diease_name]\n"
                    + "           ,[prescription]\n"
                    + "           ,[record_note])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, medicalRecord.getReservation());
            ps.setString(2, medicalRecord.getDieaseName());
            ps.setString(3, medicalRecord.getPrescription());
            ps.setString(4, medicalRecord.getRecordNote());
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void delete(int id) {
        try {
            String sql = "DELETE FROM [MedicalRecord]\n"
                    + "      WHERE record_id=?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public MedicalRecord getMedicalRCbyID(int id) {

        try {
            String sql = "SELECT [record_id]\n"
                    + "      ,[reservation_id]\n"
                    + "      ,[diease_name]\n"
                    + "      ,[prescription]\n"
                    + "      ,[record_note]\n"
                    + "  FROM [dbo].[MedicalRecord]\n"
                    + "  WHERE record_id = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MedicalRecord medicalRecord = new MedicalRecord(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));

                return medicalRecord;
            }
        } catch (Exception ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(MedicalRecord medicalRecord) {
        try {
            String sql = "UPDATE [MedicalRecord]\n"
                    + "   SET [reservation_id] = ?\n"
                    + "      ,[diease_name] = ?\n"
                    + "      ,[prescription] = ?\n"
                    + "      ,[record_note] = ?\n"
                    + " WHERE record_id = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, medicalRecord.getReservation());
            ps.setString(2, medicalRecord.getDieaseName());
            ps.setString(3, medicalRecord.getPrescription());
            ps.setString(4, medicalRecord.getRecordNote());
            ps.setInt(5, medicalRecord.getId());
            
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(MedicalRecordDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
