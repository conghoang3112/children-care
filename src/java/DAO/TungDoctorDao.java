package DAO;

import entity.Doctor;

import java.sql.SQLException;
import java.util.List;

public interface TungDoctorDao {
	int getTotalDoctor() throws SQLException;

	List<Doctor> find(int start, int end) throws SQLException;
}
