package DAO;

import context.DBContext;
import entity.*;
import utils.TungUtils;

import java.sql.*;
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

	@Override
	public boolean add(Doctor doctor, DoctorProfile doctorProfile) {
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);

			// Start stransaction
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO DoctorProfile(first_name, last_name, dob, avatar, sex, address_hospital, experience, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, doctorProfile.getFirstName());
			ps.setString(2, doctorProfile.getLastName());
			ps.setDate(3, null);
			ps.setString(4, doctorProfile.getAvatar());
			ps.setBoolean(5, doctorProfile.isSex());
			ps.setString(6, doctorProfile.getAddressHospital());
			ps.setInt(7, doctorProfile.getExperience());
			ps.setString(8, doctorProfile.getPhone());
			ps.setString(9, doctorProfile.getEmail());

			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				int doctorProfileId = rs.getInt(1);
				sql = new StringBuilder();
				sql.append("INSERT INTO Doctor(acc_id, specialist_id, profile_id, room_id) VALUES (?, ?, ?, ?)");
				ps = connection.prepareStatement(sql.toString());
				ps.setInt(1, 8);
				ps.setInt(2, doctor.getSpecialist().getId());
				ps.setInt(3, doctorProfileId);
				ps.setInt(4, 1);
				if (ps.executeUpdate() > 0) {
					connection.commit();
					return true;
				};
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException ex) {
				throw new RuntimeException(ex);
			}
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
	public Doctor findById(int doctorId, int doctorProfileId) {
		Doctor doctor = new Doctor();
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT a.doctor_id, a.acc_id, a.specialist_id, a.profile_id, a.room_id, b.specialist_name, " +
					"c.first_name, c.last_name, c.dob, c.avatar, c.sex, c.address_hospital, c.experience, c.phone, c.email" +
					"ROW_NUMBER() OVER(ORDER BY b.specialist_name DESC) as rownumber " +
					"FROM Doctor a " +
					"INNER JOIN Specialist b ON b.specialist_id = a.specialist_id " +
					"INNER JOIN DoctorProfile c ON c.profile_id = a.profile_id " +
					"WHERE a.doctor_id = ? AND a.profile_id = ?");
			sql.append(" GROUP BY a.doctor_id, a.acc_id, a.specialist_id, a.profile_id, a.room_id, b.specialist_name, " +
					"c.first_name, c.last_name, c.dob, c.avatar, c.sex, c.address_hospital, c.experience, c.phone, c.email ");
			ps = connection.prepareStatement(sql.toString());

			ps.setInt(1, doctorId);
			ps.setInt(2, doctorProfileId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int specialistId = rs.getInt("specialist_id");
				String specialistName = rs.getString("specialist_name");
				Specialist specialist = new Specialist(specialistId, specialistName);

				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String avatar = rs.getString("avatar");
				Date dob = rs.getDate("dob");
				boolean sex = rs.getBoolean("sex");
				String addressHospital = rs.getString("address_hospital");
				int experience = rs.getInt("experience");
				String phone = rs.getString("phone");
				String email = rs.getString("email");

				doctor.setId(doctorId);
				doctor.setSpecialist(specialist);

				DoctorProfile doctorProfile = new DoctorProfile();
				doctorProfile.setId(doctorProfileId);
				doctorProfile.setFirstName(firstName);
				doctorProfile.setLastName(lastName);
				doctorProfile.setAvatar(avatar);
				doctorProfile.setSex(sex);
				doctorProfile.setDob(dob);
				doctorProfile.setAddressHospital(addressHospital);
				doctorProfile.setExperience(experience);
				doctorProfile.setPhone(phone);
				doctorProfile.setEmail(email);

				doctor.setDoctorProfile(doctorProfile);
			}
		} catch (Exception e) {
			System.out.println("err: " + e.getMessage());
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
		return doctor;
	}

	@Override
	public List<Doctor> findAnotherDoctor(int doctorId, int doctorProfileId) {
		List<Doctor> doctorList = new ArrayList<>();
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT a.doctor_id, a.acc_id, a.specialist_id, a.profile_id, a.room_id, b.specialist_name, " +
					"c.first_name, c.last_name, c.dob, c.avatar, c.sex, c.address_hospital, c.experience " +
					"FROM Doctor a " +
					"INNER JOIN Specialist b ON b.specialist_id = a.specialist_id " +
					"INNER JOIN DoctorProfile c ON c.profile_id = a.profile_id WHERE a.doctor_id NOT IN (?) AND a.profile_id NOT IN (?) ");
			sql.append(" GROUP BY a.doctor_id, a.acc_id, a.specialist_id, a.profile_id, a.room_id, b.specialist_name, c.first_name, c.last_name, c.dob, c.avatar, c.sex, c.address_hospital, c.experience ");
			ps = connection.prepareStatement(sql.toString());

			ps.setInt(1, doctorId);
			ps.setInt(2, doctorProfileId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int specialistId = rs.getInt("specialist_id");
				String specialistName = rs.getString("specialist_name");
				Specialist specialist = new Specialist(specialistId, specialistName);

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
				doctorProfile.setId(doctorProfileId);
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
		return doctorList;
	}
}
