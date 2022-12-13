package DAO;

import context.DBContext;
import entity.*;
import utils.TungUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TungPatientDaoImpl extends DBContext implements TungPatientDao {
	@Override
	public List<Patient> find(int start, int end, int patientIdRq) {
		List<Patient> patientList = new ArrayList<>();
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getConnection();
			StringBuilder sql = new StringBuilder();
			if (start != 0 && end != 0) {
				sql.append("SELECT * FROM ( ");
			}
			sql.append("SELECT a.patient_id, a.user_id, a.name, a.dob, a.avatar, a.sex, a.patient_note, " +
					"b.address, a.phone, e.specialist_id, e.specialist_name, c.date_booking, f.slot_time, c.status, " +
					"ROW_NUMBER() OVER(ORDER BY c.date_booking DESC) as rownumber " +
					"FROM Patient a " +
					"INNER JOIN [User] b ON b.user_id = a.user_id " +
					"INNER JOIN Reservation c ON c.user_id = b.user_id " +
					"INNER JOIN Doctor d ON d.doctor_id = c.doctor_id " +
					"INNER JOIN Specialist e ON e.specialist_id = d.specialist_id " +
					"INNER JOIN TimeSlot f ON f.slot_id = c.time_slot_id WHERE 1=1 ");
			if (patientIdRq > 0) {
				sql.append("AND a.patient_id = ? ");
			}
			sql.append(" GROUP BY a.patient_id, a.user_id, a.name, a.dob, a.avatar, a.sex, a.patient_note, b.address, a.phone, e.specialist_id, e.specialist_name, c.date_booking, f.slot_time, c.status ");
			if (start != 0 && end != 0) {
				sql.append(") k WHERE k.rownumber BETWEEN ? AND ?");
			}
			ps = connection.prepareStatement(sql.toString());

			if (patientIdRq > 0) {
				ps.setInt(1, patientIdRq);
			}
			if (start != 0 && end != 0) {
				ps.setInt(1, start);
				ps.setInt(2, end);
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int specialistId = rs.getInt("specialist_id");
				String specialistName = rs.getString("specialist_name");
				Specialist specialist = new Specialist(specialistId, specialistName);
				Doctor doctor = new Doctor();
				doctor.setSpecialist(specialist);

				String slotTime = rs.getString("slot_time");
				TimeSlot timeSlot = new TimeSlot();
				timeSlot.setSlotTime(slotTime);

				Date dateBooking = rs.getDate("date_booking");
				String status = rs.getString("status");
				Reservation reservation = new Reservation();
				reservation.setTimeSlot(timeSlot);
				reservation.setDoctor(doctor);
				reservation.setDateBooking(dateBooking);
				reservation.setStatus(status);

				int patientId = rs.getInt("patient_id");
				int userId = rs.getInt("user_Id");

				String address = rs.getString("address");
				String phone = rs.getString("phone");
				User user = new User();
				user.setId(userId);
				user.setAddress(address);
				user.setPhone(phone);

				String patientName = rs.getString("name");
				Date dob = rs.getDate("dob");
				String avatar = rs.getString("avatar");
				boolean sex = rs.getBoolean("sex");
				String patientNote = rs.getString("patient_note");
				Patient patient = new Patient(patientId, user, patientName, dob, avatar, sex, patientNote);
				int age = TungUtils.calculateAge(dob);
				patient.setAge(age);
				patient.setReservation(reservation);

				patientList.add(patient);

			}
		} catch (Exception e) {
			System.out.println("err: " + e.getMessage());
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return patientList;
	}

	@Override
	public int getTotalPatient() {
		Connection connection = null;
		PreparedStatement ps = null;
		int totalPatient = 0;
		try {
			connection = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(*) as total FROM Patient ");
			ps = connection.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				totalPatient = rs.getInt("total");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {

			}
		}
		return totalPatient;
	}

	@Override
	public boolean add(Patient patient) {
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getConnection();

			// Start stransaction
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO Patient(user_Id, name, dob, avatar, sex, patient_note, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			ps = connection.prepareStatement(sql.toString());
			ps.setInt(1, patient.getUser().getId());
			ps.setString(2, patient.getName());
			ps.setDate(3, new java.sql.Date(patient.getDob().getTime()));
			ps.setString(4, patient.getAvatar());
			ps.setBoolean(5, false);
			ps.setString(6, "");
			ps.setString(7, patient.getPhone());
			ps.setString(8, patient.getEmail());

			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		return false;
	}

	@Override
	public boolean update(Patient patient) {
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getConnection();

			// Start stransaction
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE Patient SET name = ?, avatar = ?, patient_note = ?, phone = ?, email = ? WHERE patient_id = ?");
			ps = connection.prepareStatement(sql.toString());
			ps.setString(1, patient.getName());
			ps.setString(2, patient.getAvatar());
			ps.setString(3, patient.getNote());
			ps.setString(4, patient.getPhone());
			ps.setString(5, patient.getEmail());
			ps.setInt(6, patient.getId());

			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		return false;
	}
}
