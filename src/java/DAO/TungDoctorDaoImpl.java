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

public class TungDoctorDaoImpl extends DBContext implements TungDoctorDao {
	@Override
	public int getTotalDoctor() throws SQLException {
		Connection connection = null;
		PreparedStatement ps = null;
		int totalReservation = 0;
		try {
			connection = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(*) as total FROM Doctor ");
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

	@Override
	public List<Doctor> find(int start, int end) throws SQLException {
		List<Doctor> doctorList = new ArrayList<>();
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getConnection();
			StringBuilder sql = new StringBuilder();
			if (start != 0 && end != 0) {
				sql.append("SELECT * FROM ( ");
			}
			sql.append("SELECT a.doctor_id, a.acc_id, a.specialist_id, a.profile_id, a.room_id, b.specialist_name, " +
					"c.first_name, c.last_name, c.dob, c.avatar, c.sex, c.address_hospital, c.experience, " +
					"ROW_NUMBER() OVER(ORDER BY b.specialist_name DESC) as rownumber " +
					"FROM Doctor a " +
					"INNER JOIN Specialist b ON b.specialist_id = a.specialist_id " +
					"INNER JOIN DoctorProfile c ON c.profile_id = a.profile_id ");
			sql.append(" GROUP BY a.doctor_id, a.acc_id, a.specialist_id, a.profile_id, a.room_id, b.specialist_name, c.first_name, c.last_name, c.dob, c.avatar, c.sex, c.address_hospital, c.experience ");
			if (start != 0 && end != 0) {
				sql.append(") k WHERE k.rownumber BETWEEN ? AND ?");
			}
			ps = connection.prepareStatement(sql.toString());

			if (start != 0 && end != 0) {
				ps.setInt(1, start);
				ps.setInt(2, end);
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int specialistId = rs.getInt("specialist_id");
				String specialistName = rs.getString("specialist_name");
				Specialist specialist = new Specialist(specialistId, specialistName);

				int doctorId = rs.getInt("doctor_id");
				int profileId = rs.getInt("profile_id");


				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String avatar = rs.getString("avatar");
				Date dob = rs.getDate("dob");
				boolean sex = rs.getBoolean("sex");
				String addressHospital = rs.getString("address_hospital");
				int experience = rs.getInt("experience");

				Doctor doctor = new Doctor();
				doctor.setId(doctorId);
				doctor.setSpecialist(specialist);

				DoctorProfile doctorProfile = new DoctorProfile();
				doctorProfile.setId(profileId);
				doctorProfile.setFirstName(firstName);
				doctorProfile.setLastName(lastName);
				doctorProfile.setAvatar(avatar);
				doctorProfile.setSex(sex);
				doctorProfile.setDob(dob);
				doctorProfile.setAddressHospital(addressHospital);
				doctorProfile.setExperience(experience);

				doctor.setDoctorProfile(doctorProfile);

				doctorList.add(doctor);
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
		return doctorList;
	}
}
