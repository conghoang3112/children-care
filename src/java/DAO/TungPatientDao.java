package DAO;

import entity.Doctor;
import entity.Patient;

import java.util.List;

public interface TungPatientDao {
	List<Patient> find(int start, int end, int patientIdRq);

	int getTotalPatient();

	boolean add(Patient patient);

	boolean update(Patient patient);
}
