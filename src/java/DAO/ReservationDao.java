package DAO;

import context.DBContext;
import entity.Account;
import entity.Reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservationDao extends DBContext {
    public List<Reservation> find(int limit, int offset) throws SQLException {
        List<Reservation> reservationList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement ps = null;
        String query = "";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(query);
//            ps.setString(1, userName);
//            ps.setString(2, userPassword);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

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
        return null;
    }
}
