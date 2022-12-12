package DAO;

import context.DBContext;
import entity.Specialist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TungSpecialistDaoImpl extends DBContext implements TungSpecialistDao {
	@Override
	public List<Specialist> findAll() {
		Connection connection = null;
		PreparedStatement ps = null;
		List<Specialist> specialistList = new ArrayList<>();
		try {
			connection = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM Specialist ");
			ps = connection.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int specialistId = rs.getInt("specialist_id");
				String specialistName = rs.getString("specialist_name");
				Specialist specialist = new Specialist(specialistId, specialistName);
				specialistList.add(specialist);
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
			} catch (SQLException throwables) {
				throwables.printStackTrace();
			}
		}
		return specialistList;
	}
}
