package DAO;

import entity.Doctor;
import entity.DoctorProfile;

import java.sql.SQLException;
import java.util.List;

public interface TungDoctorDao {
	int getTotalDoctor() throws SQLException;

	List<Doctor> find(int start, int end) throws SQLException;

    boolean add(Doctor doctor, DoctorProfile doctorProfile);

	Doctor findById(int doctorId, int doctorProfileId);

	List<Doctor> findAnotherDoctor(int doctorId, int doctorProfileId);
}
