package DAO;

import context.DBContext;
import entity.*;
import utils.TungUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TungReservationDaoImpl extends DBContext implements TungReservationDao {

    @Override
    public List<Reservation> find(int start, int end) throws SQLException {
        List<Reservation> reservationList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        try {
            connection = getConnection();
            StringBuilder sql = new StringBuilder("SELECT * FROM ( ");
            sql.append("SELECT c.patient_id, c.avatar as patientAvatar, c.name, c.dob, c.sex, c.email, e.specialist_id, e.specialist_name, " +
                    "a.reservation_id, a.date_booking, f.slot_id, f.slot_time, d.doctor_id, d.profile_id, g.first_name, g.last_name, g.avatar, " +
                    "ROW_NUMBER() OVER(ORDER BY a.date_booking DESC) as rownumber " +
                    "FROM Reservation a " +
                    "INNER JOIN [User] b ON a.user_id = b.user_id " +
                    "INNER JOIN Patient c ON b.user_id = c.user_id " +
                    "INNER JOIN Doctor d ON d.doctor_id = a.doctor_id " +
                    "INNER JOIN Specialist e ON e.specialist_id = d.specialist_id " +
                    "INNER JOIN TimeSlot f ON f.slot_id = a.time_slot_id " +
                    "INNER JOIN DoctorProfile g ON g.profile_id = d.profile_id " +
                    "INNER JOIN Account h ON h.acc_id = b.acc_id ");
            sql.append(" GROUP BY c.patient_id, c.avatar, c.name, c.dob, c.sex, c.email, e.specialist_id, e.specialist_name, " +
                    "a.reservation_id, a.date_booking, f.slot_id, f.slot_time, d.doctor_id, d.profile_id, g.first_name, g.last_name, g.avatar");
            sql.append(") k WHERE k.rownumber BETWEEN ? AND ?");
            ps = connection.prepareStatement(sql.toString());
            ps.setInt(1, start);
            ps.setInt(2, end);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String email = rs.getString("email");
                Account account = new Account();
                account.setEmail(email);

                int patientId = rs.getInt("patient_id");
                String patientName = rs.getString("name");
                Date dob = rs.getDate("dob");
                int age = TungUtils.calculateAge(dob);
                boolean sex = rs.getBoolean("sex");
                String patientAvatar = rs.getString("patientAvatar");
                Patient patient = new Patient(patientId, patientName, dob, sex);
                patient.setAvatar(patientAvatar);
                patient.setAge(age);

                User user = new User();
                user.setAccount(account);
                user.setPatient(patient);


                int specialistId = rs.getInt("specialist_id");
                String specialistName = rs.getString("specialist_name");
                Specialist specialist = new Specialist(specialistId, specialistName);

                int slotId = rs.getInt("slot_id");
                String slotTime = rs.getString("slot_time");
                TimeSlot timeSlot = new TimeSlot(slotId, slotTime);

                int doctorId = rs.getInt("doctor_id");
                int profileId = rs.getInt("profile_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String avatar = rs.getString("avatar");

                Doctor doctor = new Doctor();
                doctor.setId(doctorId);
                doctor.setSpecialist(specialist);

                DoctorProfile doctorProfile = new DoctorProfile();
                doctorProfile.setId(profileId);
                doctorProfile.setFirstName(firstName);
                doctorProfile.setLastName(lastName);
                doctorProfile.setAvatar(avatar);
                doctor.setDoctorProfile(doctorProfile);

                int reservationId = rs.getInt("reservation_id");
                Date dateBooking = rs.getDate("date_booking");
                Reservation reservation = new Reservation();
                reservation.setId(reservationId);
                reservation.setDateBooking(dateBooking);
                reservation.setUser(user);
                reservation.setDoctor(doctor);
                reservation.setTimeSlot(timeSlot);

                reservationList.add(reservation);
            }
        } catch (Exception e) {
            System.out.println("err: " + e.getMessage());
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return reservationList;
    }

    @Override
    public int getTotalReservation() throws SQLException {
        Connection connection = null;
        PreparedStatement ps = null;
        int totalReservation = 0;
        try {
            connection = getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT COUNT(*) as total FROM Reservation ");
            ps = connection.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalReservation = rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return totalReservation;
    }
}
