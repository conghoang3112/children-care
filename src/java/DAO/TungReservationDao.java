package DAO;

import entity.Reservation;

import java.sql.SQLException;
import java.util.List;

public interface TungReservationDao {
	int getTotalReservation() throws SQLException;

	List<Reservation> find(int start, int end) throws SQLException;
}
